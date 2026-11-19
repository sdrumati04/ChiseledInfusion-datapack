scoreboard players set #mode ci.tmp 1
execute positioned 0.5 100.0 0.5 as @e[type=marker,tag=ci_probe,limit=1] run function chiseledinfusion:table/apply
scoreboard players set #aw citest 0
execute store result score #aw citest run data get entity @e[type=item,tag=ci_item,limit=1] Item.components."minecraft:enchantments"."minecraft:sharpness"
data modify storage citest:args args set value {}
execute store result storage citest:args args.aw int 1 run scoreboard players get #aw citest
function citest:applyreport with storage citest:args args
