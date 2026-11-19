execute as @e[type=item,tag=ci_item,distance=..1.2,sort=nearest,limit=1] run tag @s add ci_out
execute as @e[type=item,tag=ci_out] run function chiseledinfusion:table/release
execute at @s run tp @e[type=item,tag=ci_out] ~ ~ ~
execute as @e[type=item,tag=ci_out] run data merge entity @s {PickupDelay:0s,Age:0s}
tag @e[type=item,tag=ci_out] remove ci_out
playsound minecraft:entity.item.pickup block @a[distance=..8] ~ ~ ~ 1 1
