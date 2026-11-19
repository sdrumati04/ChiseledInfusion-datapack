scoreboard players add #now ci.time 1
scoreboard players add #pt ci.time 1
execute as @e[type=interaction,tag=ci_table] at @s run function chiseledinfusion:table/tick
execute as @e[type=item,tag=ci_item] at @s unless entity @e[type=interaction,tag=ci_table,distance=..1.2] run function chiseledinfusion:table/orphan
execute if score #pt ci.time matches 4.. run function chiseledinfusion:preview/all
