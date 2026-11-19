execute unless entity @s[gamemode=creative] run function chiseledinfusion:player/pay
function chiseledinfusion:apply/ench
execute if score #isrb ci.tmp matches 1 run data modify storage ci:tmp item set value {id:"minecraft:enchanted_book",count:1,components:{}}
execute if score #isbook ci.tmp matches 1 run data modify storage ci:tmp item.components."minecraft:stored_enchantments" set from storage ci:tmp ench
execute if score #isbook ci.tmp matches 0 run data modify storage ci:tmp item.components."minecraft:enchantments" set from storage ci:tmp ench
execute if score #clear ci.cfg matches 1 run data remove storage ci:tmp item.components."minecraft:repair_cost"
data modify entity @n[type=item,tag=ci_item,distance=..1.2] Item set from storage ci:tmp item
