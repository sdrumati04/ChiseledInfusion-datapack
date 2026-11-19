"""Hand-written half of the pack. Imported by generate.py."""
import os

F = {}

F["table/place"] = r'''
advancement revoke @s only chiseledinfusion:place_table
function chiseledinfusion:table/ray
'''

F["table/try"] = r'''
execute align xyz positioned ~0.5 ~ ~0.5 unless entity @e[type=interaction,tag=ci_table,distance=..0.5] run function chiseledinfusion:table/convert
'''

F["table/convert"] = r'''
summon minecraft:interaction ~ ~ ~ {Tags:["ci_table"],width:1.0f,height:1.0f,response:0b}
particle minecraft:enchant ~ ~0.6 ~ 0.3 0.3 0.3 0.05 12 normal
playsound minecraft:block.enchantment_table.use block @a[distance=..16] ~ ~ ~ 0.7 1.4
'''

F["table/tick"] = r'''
execute unless block ~ ~ ~ minecraft:enchanting_table run function chiseledinfusion:table/destroy
execute if block ~ ~ ~ minecraft:enchanting_table run function chiseledinfusion:table/tick_ok
'''

F["table/tick_ok"] = r'''
tp @e[type=item,tag=ci_item,distance=..1.2,sort=nearest,limit=1] ~ ~1.05 ~
execute as @e[type=item,tag=ci_item,distance=..1.2,sort=nearest,limit=1] run data merge entity @s {PickupDelay:32767s,Age:-32768s,NoGravity:1b,Invulnerable:1b,Motion:[0.0d,0.0d,0.0d]}
execute if data entity @s interaction on target run function chiseledinfusion:table/click
execute if data entity @s attack on attacker run function chiseledinfusion:table/attack
data remove entity @s interaction
data remove entity @s attack
'''

F["table/destroy"] = r'''
execute as @e[type=item,tag=ci_item,distance=..1.2,sort=nearest,limit=1] run function chiseledinfusion:table/release
kill @s
'''

F["table/orphan"] = r'''
function chiseledinfusion:table/release
'''

F["table/release"] = r'''
tag @s remove ci_item
data merge entity @s {PickupDelay:0s,NoGravity:0b,Invulnerable:0b,Age:0s,Motion:[0.0d,0.0d,0.0d]}
'''

F["table/attack"] = r'''
execute as @e[type=item,tag=ci_item,distance=..1.2,sort=nearest,limit=1] run function chiseledinfusion:table/release
summon minecraft:item ~ ~0.5 ~ {Item:{id:"minecraft:enchanting_table",count:1,components:{"minecraft:custom_data":{ci_table:1},"minecraft:item_name":'{"text":"Chiseled Infusion Table"}',"minecraft:max_stack_size":1}},PickupDelay:10s,Motion:[0.0d,0.2d,0.0d]}
setblock ~ ~ ~ minecraft:air
kill @e[type=interaction,tag=ci_table,distance=..0.5]
playsound minecraft:block.stone.break block @a[distance=..16] ~ ~ ~ 1 1
particle minecraft:poof ~ ~0.6 ~ 0.3 0.3 0.3 0.05 12 normal
'''

F["table/click"] = r'''
scoreboard players set #held ci.tmp 0
data modify storage ci:macro args.cat set from storage ci:cfg catalyst
function chiseledinfusion:player/holds_catalyst with storage ci:macro args
execute if entity @e[type=item,tag=ci_item,distance=..1.2] run function chiseledinfusion:table/click_has
execute unless entity @e[type=item,tag=ci_item,distance=..1.2] run function chiseledinfusion:table/click_empty
'''

F["table/click_has"] = r'''
execute if score #held ci.tmp matches 1 run function chiseledinfusion:table/infuse
execute if score #held ci.tmp matches 0 run function chiseledinfusion:table/retrieve
'''

F["table/click_empty"] = r'''
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
'''

F["player/take_one"] = r'''
$clear @s $(id) 1
'''

F["table/retrieve"] = r'''
execute as @e[type=item,tag=ci_item,distance=..1.2,sort=nearest,limit=1] run tag @s add ci_out
execute as @e[type=item,tag=ci_out] run function chiseledinfusion:table/release
execute at @s run tp @e[type=item,tag=ci_out] ~ ~ ~
execute as @e[type=item,tag=ci_out] run data merge entity @s {PickupDelay:0s,Age:0s}
tag @e[type=item,tag=ci_out] remove ci_out
playsound minecraft:entity.item.pickup block @a[distance=..8] ~ ~ ~ 1 1
'''

F["table/infuse"] = r'''
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
'''

F["table/apply"] = r'''
execute unless entity @s[gamemode=creative] run function chiseledinfusion:player/pay
function chiseledinfusion:apply/ench
execute if score #isrb ci.tmp matches 1 run data modify storage ci:tmp item set value {id:"minecraft:enchanted_book",count:1,components:{}}
execute if score #isbook ci.tmp matches 1 run data modify storage ci:tmp item.components."minecraft:stored_enchantments" set from storage ci:tmp ench
execute if score #isbook ci.tmp matches 0 run data modify storage ci:tmp item.components."minecraft:enchantments" set from storage ci:tmp ench
execute if score #clear ci.cfg matches 1 run data remove storage ci:tmp item.components."minecraft:repair_cost"
data modify entity @n[type=item,tag=ci_item,distance=..1.2] Item set from storage ci:tmp item
'''

F["scan/run"] = r'''
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
'''

F["scan/shelf"] = r'''
data remove storage ci:tmp shelf
data modify storage ci:tmp shelf set from block ~ ~ ~ Items
execute if data storage ci:tmp shelf[0].id run data modify storage ci:tmp book set from storage ci:tmp shelf[0]
execute if data storage ci:tmp shelf[0].id run function chiseledinfusion:scan/book
execute if data storage ci:tmp shelf[1].id run data modify storage ci:tmp book set from storage ci:tmp shelf[1]
execute if data storage ci:tmp shelf[1].id run function chiseledinfusion:scan/book
execute if data storage ci:tmp shelf[2].id run data modify storage ci:tmp book set from storage ci:tmp shelf[2]
execute if data storage ci:tmp shelf[2].id run function chiseledinfusion:scan/book
execute if data storage ci:tmp shelf[3].id run data modify storage ci:tmp book set from storage ci:tmp shelf[3]
execute if data storage ci:tmp shelf[3].id run function chiseledinfusion:scan/book
execute if data storage ci:tmp shelf[4].id run data modify storage ci:tmp book set from storage ci:tmp shelf[4]
execute if data storage ci:tmp shelf[4].id run function chiseledinfusion:scan/book
execute if data storage ci:tmp shelf[5].id run data modify storage ci:tmp book set from storage ci:tmp shelf[5]
execute if data storage ci:tmp shelf[5].id run function chiseledinfusion:scan/book
'''

F["scan/book"] = r'''
execute unless data storage ci:tmp book.components."minecraft:stored_enchantments" run return 0
scoreboard players add #books ci.tmp 1
function chiseledinfusion:scan/book_levels
'''

F["scan/player"] = r'''
execute store result score #pl ci.tmp run xp query @s levels
data modify storage ci:macro args.cat set from storage ci:cfg catalyst
function chiseledinfusion:player/count with storage ci:macro args
'''

F["player/count"] = r'''
$execute store result score #catc ci.tmp run clear @s $(cat) 0
'''

F["player/holds_catalyst"] = r'''
$execute if items entity @s weapon.mainhand $(cat) run scoreboard players set #held ci.tmp 1
'''

F["player/pay"] = r'''
data modify storage ci:macro args.cat set from storage ci:cfg catalyst
data modify storage ci:macro args.n set value 0
execute store result storage ci:macro args.n int 1 run scoreboard players get #cat ci.tmp
function chiseledinfusion:player/clear_cat with storage ci:macro args
data modify storage ci:macro args.n set value 0
execute store result storage ci:macro args.n int 1 run scoreboard players get #cost ci.tmp
function chiseledinfusion:player/xp with storage ci:macro args
'''

F["player/clear_cat"] = r'''
$clear @s $(cat) $(n)
'''

F["player/xp"] = r'''
$xp add @s -$(n) levels
'''

F["preview/all"] = r'''
scoreboard players set #pt ci.time 0
execute as @a[gamemode=!spectator] at @s run function chiseledinfusion:preview/check
'''

F["preview/check"] = r'''
execute if score @s ci.next > #now ci.time run return 0
function chiseledinfusion:preview/ray
'''

F["preview/show"] = r'''
execute unless entity @e[type=item,tag=ci_item,distance=..1.2] run return 0
scoreboard players set #mode ci.tmp 0
function chiseledinfusion:scan/run
function chiseledinfusion:msg/build
title @s actionbar {"nbt":"msg","storage":"ci:msg","interpret":true}
scoreboard players operation @s ci.next = #now ci.time
scoreboard players add @s ci.next 20
'''

F["msg/success"] = r'''
data modify storage ci:msg msg.text set value "Infusion complete!"
'''

F["msg/cost"] = r'''
function chiseledinfusion:msg/enchlist
data modify storage ci:msg msg.extra append value {text:" • "}
data modify storage ci:msg msg.extra append value {"score":{name:"#cost",objective:"ci.tmp"}}
data modify storage ci:msg msg.extra append value {text:" Levels, "}
data modify storage ci:msg msg.extra append value {"score":{name:"#cat",objective:"ci.tmp"}}
data modify storage ci:msg msg.extra append value {text:"x "}
data modify storage ci:msg msg.extra append value {"nbt":"catalyst_name","storage":"ci:cfg","interpret":1b}
'''

F["msg/build"] = r'''
data modify storage ci:msg msg set value {text:"",color:"red",extra:[]}
execute if score #fail ci.tmp matches 0 run data modify storage ci:msg msg.color set value "green"
execute if score #mode ci.tmp matches 0 if score #fail ci.tmp matches 1..3 run data modify storage ci:msg msg.color set value "gray"
execute if score #mode ci.tmp matches 0 unless score #fail ci.tmp matches 1..3 run function chiseledinfusion:msg/cost
execute if score #mode ci.tmp matches 1 if score #fail ci.tmp matches 0 run function chiseledinfusion:msg/success
execute if score #fail ci.tmp matches 1 run data modify storage ci:msg msg.text set value "No enchanted books nearby"
execute if score #fail ci.tmp matches 2 run data modify storage ci:msg msg.text set value "No applicable enchantments for this item"
execute if score #fail ci.tmp matches 3 run data modify storage ci:msg msg.text set value "Maximum level reached"
execute if score #mode ci.tmp matches 1 if score #fail ci.tmp matches 5 run data modify storage ci:msg msg.text set value "Requires Crying Obsidian below"
execute if score #mode ci.tmp matches 1 if score #fail ci.tmp matches 4 run data modify storage ci:msg msg.extra set value [{text:"Not enough bookshelves ("},{"score":{name:"#shelf",objective:"ci.tmp"}},{text:"/"},{"score":{name:"#need",objective:"ci.tmp"}},{text:")"}]
execute if score #mode ci.tmp matches 1 if score #fail ci.tmp matches 6 run data modify storage ci:msg msg.extra set value [{text:"Not enough XP and catalyst ("},{"score":{name:"#cost",objective:"ci.tmp"}},{text:" lvl, "},{"score":{name:"#cat",objective:"ci.tmp"}},{text:"x "},{"nbt":"catalyst_name","storage":"ci:cfg","interpret":1b},{"text":")"}]
execute if score #mode ci.tmp matches 1 if score #fail ci.tmp matches 7 run data modify storage ci:msg msg.extra set value [{text:"Not enough XP ("},{"score":{name:"#cost",objective:"ci.tmp"}},{text:" lvl)"}]
execute if score #mode ci.tmp matches 1 if score #fail ci.tmp matches 8 run data modify storage ci:msg msg.extra set value [{text:"Not enough catalyst ("},{"score":{name:"#cat",objective:"ci.tmp"}},{text:"x "},{"nbt":"catalyst_name","storage":"ci:cfg","interpret":1b},{"text":")"}]
execute unless data storage ci:msg msg.extra[0] run data remove storage ci:msg msg.extra
'''

F["config/defaults"] = r'''
scoreboard players set #two ci.tmp 2
scoreboard players set #xh ci.cfg 2
scoreboard players set #xv ci.cfg 1
scoreboard players set #xp ci.cfg 3
scoreboard players set #lapis ci.cfg 1
scoreboard players set #maxxp ci.cfg 30
scoreboard players set #clear ci.cfg 1
data merge storage ci:cfg {catalyst:"minecraft:lapis_lazuli",catalyst_name:{translate:"item.minecraft.lapis_lazuli"}}
scoreboard players set #init ci.cfg 2
'''

F["load"] = r'''
scoreboard objectives add ci.tmp dummy
scoreboard objectives add ci.ench dummy
scoreboard objectives add ci.cfg dummy
scoreboard objectives add ci.next dummy
scoreboard objectives add ci.time dummy
execute unless score #init ci.cfg matches 2 run function chiseledinfusion:config/defaults
'''

F["tick"] = r'''
scoreboard players add #now ci.time 1
scoreboard players add #pt ci.time 1
execute as @e[type=interaction,tag=ci_table] at @s run function chiseledinfusion:table/tick
execute as @e[type=item,tag=ci_item] at @s unless entity @e[type=interaction,tag=ci_table,distance=..1.2] run function chiseledinfusion:table/orphan
execute if score #pt ci.time matches 4.. run function chiseledinfusion:preview/all
'''


def emit(root, fn):
    for rel, body in F.items():
        p = os.path.join(fn, rel.replace("/", os.sep) + ".mcfunction")
        os.makedirs(os.path.dirname(p), exist_ok=True)
        with open(p, "w", encoding="utf-8", newline="\n") as f:
            f.write(body.strip() + "\n")
