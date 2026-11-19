execute unless entity @e[type=item,tag=ci_item,distance=..1.2] run return 0
scoreboard players set #mode ci.tmp 0
function chiseledinfusion:scan/run
function chiseledinfusion:msg/build
title @s actionbar {"nbt":"msg","storage":"ci:msg","interpret":true}
scoreboard players operation @s ci.next = #now ci.time
scoreboard players add @s ci.next 20
