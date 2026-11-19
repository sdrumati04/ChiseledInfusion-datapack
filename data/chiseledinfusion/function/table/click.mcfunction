scoreboard players set #held ci.tmp 0
data modify storage ci:macro args.cat set from storage ci:cfg catalyst
function chiseledinfusion:player/holds_catalyst with storage ci:macro args
execute if entity @e[type=item,tag=ci_item,distance=..1.2] run function chiseledinfusion:table/click_has
execute unless entity @e[type=item,tag=ci_item,distance=..1.2] run function chiseledinfusion:table/click_empty
