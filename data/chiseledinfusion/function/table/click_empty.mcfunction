scoreboard players set #phok ci.tmp 0
execute if items entity @s weapon.mainhand * run summon minecraft:item ~ ~1.05 ~ {Tags:["ci_item","ci_new"],PickupDelay:32767s,Age:-32768s,NoGravity:1b,Invulnerable:1b,Motion:[0.0d,0.0d,0.0d],Item:{id:"minecraft:paper",count:1,components:{"minecraft:custom_data":{ci_ph:1b}}}}
execute if items entity @s weapon.mainhand * run item replace entity @e[type=item,tag=ci_new,limit=1] contents from entity @s weapon.mainhand
execute unless entity @e[type=item,tag=ci_new] run return 0
execute unless data entity @e[type=item,tag=ci_new,limit=1] Item.components."minecraft:custom_data".ci_ph run scoreboard players set #phok ci.tmp 1
execute if score #phok ci.tmp matches 1 run data modify entity @e[type=item,tag=ci_new,limit=1] Item.count set value 1
execute if score #phok ci.tmp matches 1 unless entity @s[gamemode=creative] run data modify storage ci:macro args.id set from entity @e[type=item,tag=ci_new,limit=1] Item.id
execute if score #phok ci.tmp matches 1 run tag @e[type=item,tag=ci_new,limit=1] remove ci_new
execute if score #phok ci.tmp matches 1 unless entity @s[gamemode=creative] run function chiseledinfusion:player/take_one with storage ci:macro args
execute if score #phok ci.tmp matches 1 run playsound minecraft:entity.item.pickup block @a[distance=..8] ~ ~ ~ 1 1
execute if score #phok ci.tmp matches 0 run kill @e[type=item,tag=ci_new]
