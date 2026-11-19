forceload add 0 0
kill @e[type=item,tag=ci_item]
kill @e[type=interaction,tag=ci_table]
kill @e[type=marker,tag=ci_probe]
setblock 0 100 0 minecraft:enchanting_table
setblock 2 100 0 minecraft:chiseled_bookshelf
data merge block 2 100 0 {Items:[{Slot:0b,id:"minecraft:enchanted_book",count:1,components:{"minecraft:stored_enchantments":{"minecraft:sharpness":1}}}]}
summon minecraft:interaction 0.5 100 0.5 {Tags:["ci_table"],width:1.0f,height:1.0f,response:0b}
summon minecraft:item 0.5 101.05 0.5 {Item:{id:"minecraft:diamond_sword",count:1},Tags:["ci_item"],PickupDelay:32767s,NoGravity:1b,Invulnerable:1b,Age:-32768s}
summon minecraft:marker 0.5 100 0.5 {Tags:["ci_probe"]}
say CITEST SETUP
