tp @e[type=item,tag=ci_item,distance=..1.2,sort=nearest,limit=1] ~ ~1.05 ~
execute as @e[type=item,tag=ci_item,distance=..1.2,sort=nearest,limit=1] run data merge entity @s {PickupDelay:32767s,Age:-32768s,NoGravity:1b,Invulnerable:1b,Motion:[0.0d,0.0d,0.0d]}
execute if data entity @s interaction on target run function chiseledinfusion:table/click
execute if data entity @s attack on attacker run function chiseledinfusion:table/attack
data remove entity @s interaction
data remove entity @s attack
