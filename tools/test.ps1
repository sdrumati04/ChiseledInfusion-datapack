<#
.SYNOPSIS
    End-to-end regression test for the Chiseled Infusion datapack.

.DESCRIPTION
    Boots a real, vanilla Minecraft 26.3 dedicated server in a throw-away world,
    installs this datapack plus the companion harness (tools/harness) and asserts
    that the pack still reads enchanted books and applies enchantments.

    Steps:
      1. tools/generate.py + tools/lint.py       (unless -SkipGenerate)
      2. fresh world in $env:TEMP\chiseled-infusion-test
      3. vanilla 26.3 server.jar (downloaded once, cached in .cache\)
      4. wait for "CITEST SCAN PASS" and "CITEST APPLY PASS"
      5. exit 0 on success, 1 on failure

    The server jar is NOT part of this repository: it is downloaded from Mojang
    on first run and cached in .cache\ (git-ignored).

.PARAMETER ServerJar
    Use an existing server.jar instead of downloading it.

.PARAMETER Port
    Server port (default 25601). Only used locally.

.PARAMETER TimeoutSec
    Overall timeout for the test run (default 180).

.PARAMETER Keep
    Keep the test world and console logs for inspection.

.PARAMETER SkipGenerate
    Do not run tools/generate.py and tools/lint.py before testing.
#>
[CmdletBinding()]
param(
    [string] $ServerJar,
    [int]    $Port = 25601,
    [int]    $TimeoutSec = 180,
    [switch] $Keep,
    [switch] $SkipGenerate
)

$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'

$root  = Split-Path -Parent $PSScriptRoot
$cache = Join-Path $root '.cache'
$work  = Join-Path ([System.IO.Path]::GetTempPath()) 'chiseled-infusion-test'
$log   = Join-Path $work 'console.log'

function Write-Step($text) { Write-Host "==> $text" -ForegroundColor Cyan }
function Write-Ok($text)   { Write-Host "    $text" -ForegroundColor Green }
function Write-Bad($text)  { Write-Host "    $text" -ForegroundColor Red }

# ---------------------------------------------------------------- generate + lint
if (-not $SkipGenerate) {
    $python = Get-Command python -ErrorAction SilentlyContinue
    if ($python) {
        Write-Step 'Generating pack'
        Push-Location $root
        try {
            python tools/generate.py
            if ($LASTEXITCODE -ne 0) { throw 'tools/generate.py failed' }

            $lint = python tools/lint.py 2>&1
            $lint | ForEach-Object { Write-Host "    $_" }
            if ($lint -match 'errors:\s*([1-9][0-9]*)') { throw 'tools/lint.py reported errors' }
        } finally {
            Pop-Location
        }
    } else {
        Write-Host '    python not found, skipping generate/lint' -ForegroundColor Yellow
    }
}

# ---------------------------------------------------------------- server jar
if ($ServerJar) {
    if (-not (Test-Path $ServerJar)) { throw "server jar not found: $ServerJar" }
    $jar = (Resolve-Path $ServerJar).Path
    Write-Step "Using server jar $jar"
} else {
    New-Item -ItemType Directory -Force -Path $cache | Out-Null
    $jar = Join-Path $cache 'server-26.3.jar'
    if (-not (Test-Path $jar)) {
        Write-Step 'Downloading vanilla 26.3 server.jar from Mojang'
        $manifestUrl = 'https://piston-meta.mojang.com/mc/game/version_manifest_v2.json'
        $manifest = Invoke-RestMethod -Uri $manifestUrl -UseBasicParsing
        $version  = $manifest.versions | Where-Object { $_.id -eq '26.3' } | Select-Object -First 1
        if (-not $version) { throw 'Minecraft 26.3 not found in the version manifest.' }
        $meta = Invoke-RestMethod -Uri $version.url -UseBasicParsing
        Invoke-WebRequest -Uri $meta.downloads.server.url -OutFile $jar -UseBasicParsing
    }
    Write-Ok "cached at $jar"
}

$java = Get-Command java -ErrorAction SilentlyContinue
if (-not $java) { throw 'java (25+) not found on PATH.' }

# ---------------------------------------------------------------- fresh world
if (-not $Keep) { Remove-Item -Recurse -Force $work -ErrorAction SilentlyContinue }
New-Item -ItemType Directory -Force -Path $work | Out-Null
Set-Content -Path (Join-Path $work 'eula.txt') -Value 'eula=true' -Encoding ascii
@(
    'level-name=world'
    'level-type=minecraft\:flat'
    "server-port=$Port"
    'online-mode=false'
    'max-players=1'
    'spawn-protection=0'
    'view-distance=4'
    'simulation-distance=4'
    'enable-status=false'
    'sync-chunk-writes=false'
    'allow-nether=false'
    'motd=chiseled-infusion-test'
) | Set-Content -Path (Join-Path $work 'server.properties') -Encoding ascii

Write-Step 'Installing pack + harness'
$dp = Join-Path $work 'world\datapacks'
New-Item -ItemType Directory -Force -Path $dp | Out-Null

$packDst = Join-Path $dp 'chiseled_infusion'
New-Item -ItemType Directory -Force -Path $packDst | Out-Null
Copy-Item (Join-Path $root 'pack.mcmeta') $packDst -Force
Copy-Item (Join-Path $root 'data') $packDst -Recurse -Force

$harnessSrc = Join-Path $root 'tools\harness'
$harnessDst = Join-Path $dp 'citest'
Copy-Item $harnessSrc $harnessDst -Recurse -Force
Write-Ok 'chiseled_infusion + citest'

# ---------------------------------------------------------------- run
Write-Step 'Starting server'
$argLine = "-Xmx1500M -jar `"$jar`" nogui"
$proc = Start-Process -FilePath $java.Source `
    -ArgumentList $argLine `
    -WorkingDirectory $work `
    -RedirectStandardOutput $log `
    -RedirectStandardError (Join-Path $work 'console.err') `
    -NoNewWindow -PassThru

$deadline = (Get-Date).AddSeconds($TimeoutSec)
$scan = $null
$apply = $null
try {
    while ((Get-Date) -lt $deadline) {
        Start-Sleep -Milliseconds 400
        if (Test-Path $log) {
            $text = Get-Content $log -Raw -ErrorAction SilentlyContinue
            if ($text) {
                if (-not $scan) {
                    $m = [regex]::Match($text, 'CITEST SCAN (PASS|FAIL[^\r\n]*)')
                    if ($m.Success) { $scan = $m.Groups[1].Value.Trim() }
                }
                if (-not $apply) {
                    $m = [regex]::Match($text, 'CITEST APPLY (PASS|FAIL[^\r\n]*)')
                    if ($m.Success) { $apply = $m.Groups[1].Value.Trim() }
                }
                if ($scan -and $apply) { break }
            }
        }
        if ($proc.HasExited) { break }
    }
} finally {
    if (-not $proc.HasExited) {
        $proc.Kill()
        $proc.WaitForExit(10000) | Out-Null
    }
    # a stray java can keep the world files open: make sure it is gone
    Get-CimInstance Win32_Process -Filter "Name='java.exe'" -ErrorAction SilentlyContinue |
        Where-Object { $_.CommandLine -and $_.CommandLine.Contains($jar) } |
        ForEach-Object { Stop-Process -Id $_.ProcessId -Force -ErrorAction SilentlyContinue }
}

# ---------------------------------------------------------------- report
if (Test-Path $log) {
    Get-Content $log |
        Select-String -Pattern 'CITEST|Failed to load|Whilst parsing|Done \(' |
        ForEach-Object { Write-Host "    $($_.Line)" }
}

$failures = @()
if (-not $scan)  { $failures += 'scan stage never reported (pack not loaded?)' }
elseif ($scan -ne 'PASS') { $failures += "scan: $scan" }
if (-not $apply) { $failures += 'apply stage never reported' }
elseif ($apply -ne 'PASS') { $failures += "apply: $apply" }

Write-Host ''
if ($failures.Count -eq 0) {
    Write-Host 'RESULT: PASS' -ForegroundColor Green
    if (-not $Keep) { Remove-Item -Recurse -Force $work -ErrorAction SilentlyContinue }
    exit 0
}

Write-Host 'RESULT: FAIL' -ForegroundColor Red
$failures | ForEach-Object { Write-Bad $_ }
Write-Host "    logs kept in $work" -ForegroundColor Yellow
exit 1
