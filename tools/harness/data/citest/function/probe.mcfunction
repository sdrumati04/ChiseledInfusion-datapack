data modify storage citest:args args set value {}
execute positioned 0.5 100.0 0.5 as @e[type=marker,tag=ci_probe,limit=1] run function chiseledinfusion:scan/run
execute store result storage citest:args args.books int 1 run scoreboard players get #books ci.tmp
execute store result storage citest:args args.app int 1 run scoreboard players get #applicable ci.tmp
execute store result storage citest:args args.bsh int 1 run scoreboard players get #b.sharpness ci.ench
execute store result storage citest:args args.csh int 1 run scoreboard players get #c.sharpness ci.ench
execute store result storage citest:args args.shelf int 1 run scoreboard players get #shelf ci.tmp
execute store result storage citest:args args.fail int 1 run scoreboard players get #fail ci.tmp
function citest:report with storage citest:args args
