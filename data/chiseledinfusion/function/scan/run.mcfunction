data modify storage ci:tmp item set from entity @n[type=item,tag=ci_item,distance=..1.2] Item
function chiseledinfusion:scan/reset
execute if data storage ci:tmp {item:{id:"minecraft:book"}} run scoreboard players set #isrb ci.tmp 1
execute if data storage ci:tmp {item:{id:"minecraft:book"}} run scoreboard players set #isbook ci.tmp 1
execute if data storage ci:tmp {item:{id:"minecraft:enchanted_book"}} run scoreboard players set #isbook ci.tmp 1
function chiseledinfusion:scan/current
execute if entity @s[gamemode=creative] run scoreboard players set #creative ci.tmp 1
execute if block ~ ~-1 ~ minecraft:crying_obsidian run scoreboard players set #cry ci.tmp 1
function chiseledinfusion:scan/power
function chiseledinfusion:scan/shelves
function chiseledinfusion:scan/player
function chiseledinfusion:scan/evaluate
