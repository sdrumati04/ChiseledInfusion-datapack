scoreboard players set #mode ci.tmp 1
function chiseledinfusion:scan/run
execute if score #fail ci.tmp matches 0 run function chiseledinfusion:table/apply
function chiseledinfusion:msg/build
title @s actionbar {"nbt":"msg","storage":"ci:msg","interpret":true}
scoreboard players operation @s ci.next = #now ci.time
scoreboard players add @s ci.next 45
execute if score #fail ci.tmp matches 0 run particle minecraft:enchant ~ ~1.05 ~ 0.5 0.5 0.5 0.2 60 normal
execute if score #fail ci.tmp matches 0 run playsound minecraft:block.enchantment_table.use block @a[distance=..16] ~ ~ ~ 1 1
execute unless score #fail ci.tmp matches 0 run playsound minecraft:entity.villager.no player @a[distance=..16] ~ ~ ~ 1 1
