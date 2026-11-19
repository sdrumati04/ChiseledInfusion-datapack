execute as @e[type=item,tag=ci_item,distance=..1.2,sort=nearest,limit=1] run function chiseledinfusion:table/release
summon minecraft:item ~ ~0.5 ~ {Item:{id:"minecraft:enchanting_table",count:1,components:{"minecraft:custom_data":{ci_table:1},"minecraft:item_name":'{"text":"Chiseled Infusion Table"}',"minecraft:max_stack_size":1}},PickupDelay:10s,Motion:[0.0d,0.2d,0.0d]}
setblock ~ ~ ~ minecraft:air
kill @e[type=interaction,tag=ci_table,distance=..0.5]
playsound minecraft:block.stone.break block @a[distance=..16] ~ ~ ~ 1 1
particle minecraft:poof ~ ~0.6 ~ 0.3 0.3 0.3 0.05 12 normal
