import os, re, sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
FN = os.path.join(ROOT, "data", "chiseledinfusion", "function")

funcs = set()
for dirpath, _, files in os.walk(FN):
    for f in files:
        rel = os.path.relpath(os.path.join(dirpath, f), FN).replace("\\", "/")
        if rel.endswith(".mcfunction"):
            rel = rel[: -len(".mcfunction")]
        funcs.add("chiseledinfusion:" + rel)

errors = []
for dirpath, _, files in os.walk(FN):
    for f in files:
        p = os.path.join(dirpath, f)
        for n, line in enumerate(open(p, encoding="utf-8").read().splitlines(), 1):
            if not line.strip():
                errors.append("%s:%d empty line" % (f, n))
                continue
            if line.count('"') % 2:
                errors.append("%s:%d odd quotes: %s" % (f, n, line[:90]))
            for m in re.finditer(r"(?:^| )function ([a-z0-9_./:-]+)", line):
                ref = m.group(1)
                if ref not in funcs:
                    errors.append("%s:%d missing function %s" % (f, n, ref))
            if line.lstrip().startswith("$"):
                continue

print("functions:", len(funcs))
print("errors:", len(errors))
for e in errors[:40]:
    print(" ", e)
