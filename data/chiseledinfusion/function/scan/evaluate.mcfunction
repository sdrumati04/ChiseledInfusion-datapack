execute if score #b.aqua_affinity ci.ench matches 1.. if score #isbook ci.tmp matches 0 unless items entity @n[type=item,tag=ci_item,distance=..1.2] contents #minecraft:enchantable/head_armor run scoreboard players set #b.aqua_affinity ci.ench 0
execute if score #b.aqua_affinity ci.ench matches 1.. run scoreboard players set #applicable ci.tmp 1
scoreboard players operation #t.aqua_affinity ci.ench = #c.aqua_affinity ci.ench
execute if score #b.aqua_affinity ci.ench > #t.aqua_affinity ci.ench run scoreboard players operation #t.aqua_affinity ci.ench = #b.aqua_affinity ci.ench
execute if score #t.aqua_affinity ci.ench > #c.aqua_affinity ci.ench run scoreboard players add #upgrades ci.tmp 1
execute if score #t.aqua_affinity ci.ench matches 2.. run scoreboard players set #overcap ci.tmp 1
execute if score #t.aqua_affinity ci.ench > #c.aqua_affinity ci.ench run scoreboard players operation #lvlsum ci.tmp += #t.aqua_affinity ci.ench
execute if score #t.aqua_affinity ci.ench > #c.aqua_affinity ci.ench run scoreboard players operation #lvlsum ci.tmp -= #c.aqua_affinity ci.ench
execute if score #b.bane_of_arthropods ci.ench matches 1.. if score #isbook ci.tmp matches 0 unless items entity @n[type=item,tag=ci_item,distance=..1.2] contents #minecraft:enchantable/weapon run scoreboard players set #b.bane_of_arthropods ci.ench 0
execute if score #b.bane_of_arthropods ci.ench matches 1.. run scoreboard players set #applicable ci.tmp 1
scoreboard players operation #t.bane_of_arthropods ci.ench = #c.bane_of_arthropods ci.ench
execute if score #b.bane_of_arthropods ci.ench > #t.bane_of_arthropods ci.ench run scoreboard players operation #t.bane_of_arthropods ci.ench = #b.bane_of_arthropods ci.ench
execute if score #t.bane_of_arthropods ci.ench > #c.bane_of_arthropods ci.ench run scoreboard players add #upgrades ci.tmp 1
execute if score #t.bane_of_arthropods ci.ench matches 6.. run scoreboard players set #overcap ci.tmp 1
execute if score #t.bane_of_arthropods ci.ench > #c.bane_of_arthropods ci.ench run scoreboard players operation #lvlsum ci.tmp += #t.bane_of_arthropods ci.ench
execute if score #t.bane_of_arthropods ci.ench > #c.bane_of_arthropods ci.ench run scoreboard players operation #lvlsum ci.tmp -= #c.bane_of_arthropods ci.ench
execute if score #b.binding_curse ci.ench matches 1.. if score #isbook ci.tmp matches 0 unless items entity @n[type=item,tag=ci_item,distance=..1.2] contents #minecraft:enchantable/equippable run scoreboard players set #b.binding_curse ci.ench 0
execute if score #b.binding_curse ci.ench matches 1.. run scoreboard players set #applicable ci.tmp 1
scoreboard players operation #t.binding_curse ci.ench = #c.binding_curse ci.ench
execute if score #b.binding_curse ci.ench > #t.binding_curse ci.ench run scoreboard players operation #t.binding_curse ci.ench = #b.binding_curse ci.ench
execute if score #t.binding_curse ci.ench > #c.binding_curse ci.ench run scoreboard players add #upgrades ci.tmp 1
execute if score #t.binding_curse ci.ench matches 2.. run scoreboard players set #overcap ci.tmp 1
execute if score #t.binding_curse ci.ench > #c.binding_curse ci.ench run scoreboard players operation #lvlsum ci.tmp += #t.binding_curse ci.ench
execute if score #t.binding_curse ci.ench > #c.binding_curse ci.ench run scoreboard players operation #lvlsum ci.tmp -= #c.binding_curse ci.ench
execute if score #b.blast_protection ci.ench matches 1.. if score #isbook ci.tmp matches 0 unless items entity @n[type=item,tag=ci_item,distance=..1.2] contents #minecraft:enchantable/armor run scoreboard players set #b.blast_protection ci.ench 0
execute if score #b.blast_protection ci.ench matches 1.. run scoreboard players set #applicable ci.tmp 1
scoreboard players operation #t.blast_protection ci.ench = #c.blast_protection ci.ench
execute if score #b.blast_protection ci.ench > #t.blast_protection ci.ench run scoreboard players operation #t.blast_protection ci.ench = #b.blast_protection ci.ench
execute if score #t.blast_protection ci.ench > #c.blast_protection ci.ench run scoreboard players add #upgrades ci.tmp 1
execute if score #t.blast_protection ci.ench matches 5.. run scoreboard players set #overcap ci.tmp 1
execute if score #t.blast_protection ci.ench > #c.blast_protection ci.ench run scoreboard players operation #lvlsum ci.tmp += #t.blast_protection ci.ench
execute if score #t.blast_protection ci.ench > #c.blast_protection ci.ench run scoreboard players operation #lvlsum ci.tmp -= #c.blast_protection ci.ench
execute if score #b.breach ci.ench matches 1.. if score #isbook ci.tmp matches 0 unless items entity @n[type=item,tag=ci_item,distance=..1.2] contents #minecraft:enchantable/mace run scoreboard players set #b.breach ci.ench 0
execute if score #b.breach ci.ench matches 1.. run scoreboard players set #applicable ci.tmp 1
scoreboard players operation #t.breach ci.ench = #c.breach ci.ench
execute if score #b.breach ci.ench > #t.breach ci.ench run scoreboard players operation #t.breach ci.ench = #b.breach ci.ench
execute if score #t.breach ci.ench > #c.breach ci.ench run scoreboard players add #upgrades ci.tmp 1
execute if score #t.breach ci.ench matches 5.. run scoreboard players set #overcap ci.tmp 1
execute if score #t.breach ci.ench > #c.breach ci.ench run scoreboard players operation #lvlsum ci.tmp += #t.breach ci.ench
execute if score #t.breach ci.ench > #c.breach ci.ench run scoreboard players operation #lvlsum ci.tmp -= #c.breach ci.ench
execute if score #b.channeling ci.ench matches 1.. if score #isbook ci.tmp matches 0 unless items entity @n[type=item,tag=ci_item,distance=..1.2] contents #minecraft:enchantable/trident run scoreboard players set #b.channeling ci.ench 0
execute if score #b.channeling ci.ench matches 1.. run scoreboard players set #applicable ci.tmp 1
scoreboard players operation #t.channeling ci.ench = #c.channeling ci.ench
execute if score #b.channeling ci.ench > #t.channeling ci.ench run scoreboard players operation #t.channeling ci.ench = #b.channeling ci.ench
execute if score #t.channeling ci.ench > #c.channeling ci.ench run scoreboard players add #upgrades ci.tmp 1
execute if score #t.channeling ci.ench matches 2.. run scoreboard players set #overcap ci.tmp 1
execute if score #t.channeling ci.ench > #c.channeling ci.ench run scoreboard players operation #lvlsum ci.tmp += #t.channeling ci.ench
execute if score #t.channeling ci.ench > #c.channeling ci.ench run scoreboard players operation #lvlsum ci.tmp -= #c.channeling ci.ench
execute if score #b.density ci.ench matches 1.. if score #isbook ci.tmp matches 0 unless items entity @n[type=item,tag=ci_item,distance=..1.2] contents #minecraft:enchantable/mace run scoreboard players set #b.density ci.ench 0
execute if score #b.density ci.ench matches 1.. run scoreboard players set #applicable ci.tmp 1
scoreboard players operation #t.density ci.ench = #c.density ci.ench
execute if score #b.density ci.ench > #t.density ci.ench run scoreboard players operation #t.density ci.ench = #b.density ci.ench
execute if score #t.density ci.ench > #c.density ci.ench run scoreboard players add #upgrades ci.tmp 1
execute if score #t.density ci.ench matches 6.. run scoreboard players set #overcap ci.tmp 1
execute if score #t.density ci.ench > #c.density ci.ench run scoreboard players operation #lvlsum ci.tmp += #t.density ci.ench
execute if score #t.density ci.ench > #c.density ci.ench run scoreboard players operation #lvlsum ci.tmp -= #c.density ci.ench
execute if score #b.depth_strider ci.ench matches 1.. if score #isbook ci.tmp matches 0 unless items entity @n[type=item,tag=ci_item,distance=..1.2] contents #minecraft:enchantable/foot_armor run scoreboard players set #b.depth_strider ci.ench 0
execute if score #b.depth_strider ci.ench matches 1.. run scoreboard players set #applicable ci.tmp 1
scoreboard players operation #t.depth_strider ci.ench = #c.depth_strider ci.ench
execute if score #b.depth_strider ci.ench > #t.depth_strider ci.ench run scoreboard players operation #t.depth_strider ci.ench = #b.depth_strider ci.ench
execute if score #t.depth_strider ci.ench > #c.depth_strider ci.ench run scoreboard players add #upgrades ci.tmp 1
execute if score #t.depth_strider ci.ench matches 4.. run scoreboard players set #overcap ci.tmp 1
execute if score #t.depth_strider ci.ench > #c.depth_strider ci.ench run scoreboard players operation #lvlsum ci.tmp += #t.depth_strider ci.ench
execute if score #t.depth_strider ci.ench > #c.depth_strider ci.ench run scoreboard players operation #lvlsum ci.tmp -= #c.depth_strider ci.ench
execute if score #b.efficiency ci.ench matches 1.. if score #isbook ci.tmp matches 0 unless items entity @n[type=item,tag=ci_item,distance=..1.2] contents #minecraft:enchantable/mining run scoreboard players set #b.efficiency ci.ench 0
execute if score #b.efficiency ci.ench matches 1.. run scoreboard players set #applicable ci.tmp 1
scoreboard players operation #t.efficiency ci.ench = #c.efficiency ci.ench
execute if score #b.efficiency ci.ench > #t.efficiency ci.ench run scoreboard players operation #t.efficiency ci.ench = #b.efficiency ci.ench
execute if score #t.efficiency ci.ench > #c.efficiency ci.ench run scoreboard players add #upgrades ci.tmp 1
execute if score #t.efficiency ci.ench matches 6.. run scoreboard players set #overcap ci.tmp 1
execute if score #t.efficiency ci.ench > #c.efficiency ci.ench run scoreboard players operation #lvlsum ci.tmp += #t.efficiency ci.ench
execute if score #t.efficiency ci.ench > #c.efficiency ci.ench run scoreboard players operation #lvlsum ci.tmp -= #c.efficiency ci.ench
execute if score #b.feather_falling ci.ench matches 1.. if score #isbook ci.tmp matches 0 unless items entity @n[type=item,tag=ci_item,distance=..1.2] contents #minecraft:enchantable/foot_armor run scoreboard players set #b.feather_falling ci.ench 0
execute if score #b.feather_falling ci.ench matches 1.. run scoreboard players set #applicable ci.tmp 1
scoreboard players operation #t.feather_falling ci.ench = #c.feather_falling ci.ench
execute if score #b.feather_falling ci.ench > #t.feather_falling ci.ench run scoreboard players operation #t.feather_falling ci.ench = #b.feather_falling ci.ench
execute if score #t.feather_falling ci.ench > #c.feather_falling ci.ench run scoreboard players add #upgrades ci.tmp 1
execute if score #t.feather_falling ci.ench matches 5.. run scoreboard players set #overcap ci.tmp 1
execute if score #t.feather_falling ci.ench > #c.feather_falling ci.ench run scoreboard players operation #lvlsum ci.tmp += #t.feather_falling ci.ench
execute if score #t.feather_falling ci.ench > #c.feather_falling ci.ench run scoreboard players operation #lvlsum ci.tmp -= #c.feather_falling ci.ench
execute if score #b.fire_aspect ci.ench matches 1.. if score #isbook ci.tmp matches 0 unless items entity @n[type=item,tag=ci_item,distance=..1.2] contents #minecraft:enchantable/fire_aspect run scoreboard players set #b.fire_aspect ci.ench 0
execute if score #b.fire_aspect ci.ench matches 1.. run scoreboard players set #applicable ci.tmp 1
scoreboard players operation #t.fire_aspect ci.ench = #c.fire_aspect ci.ench
execute if score #b.fire_aspect ci.ench > #t.fire_aspect ci.ench run scoreboard players operation #t.fire_aspect ci.ench = #b.fire_aspect ci.ench
execute if score #t.fire_aspect ci.ench > #c.fire_aspect ci.ench run scoreboard players add #upgrades ci.tmp 1
execute if score #t.fire_aspect ci.ench matches 3.. run scoreboard players set #overcap ci.tmp 1
execute if score #t.fire_aspect ci.ench > #c.fire_aspect ci.ench run scoreboard players operation #lvlsum ci.tmp += #t.fire_aspect ci.ench
execute if score #t.fire_aspect ci.ench > #c.fire_aspect ci.ench run scoreboard players operation #lvlsum ci.tmp -= #c.fire_aspect ci.ench
execute if score #b.fire_protection ci.ench matches 1.. if score #isbook ci.tmp matches 0 unless items entity @n[type=item,tag=ci_item,distance=..1.2] contents #minecraft:enchantable/armor run scoreboard players set #b.fire_protection ci.ench 0
execute if score #b.fire_protection ci.ench matches 1.. run scoreboard players set #applicable ci.tmp 1
scoreboard players operation #t.fire_protection ci.ench = #c.fire_protection ci.ench
execute if score #b.fire_protection ci.ench > #t.fire_protection ci.ench run scoreboard players operation #t.fire_protection ci.ench = #b.fire_protection ci.ench
execute if score #t.fire_protection ci.ench > #c.fire_protection ci.ench run scoreboard players add #upgrades ci.tmp 1
execute if score #t.fire_protection ci.ench matches 5.. run scoreboard players set #overcap ci.tmp 1
execute if score #t.fire_protection ci.ench > #c.fire_protection ci.ench run scoreboard players operation #lvlsum ci.tmp += #t.fire_protection ci.ench
execute if score #t.fire_protection ci.ench > #c.fire_protection ci.ench run scoreboard players operation #lvlsum ci.tmp -= #c.fire_protection ci.ench
execute if score #b.flame ci.ench matches 1.. if score #isbook ci.tmp matches 0 unless items entity @n[type=item,tag=ci_item,distance=..1.2] contents #minecraft:enchantable/bow run scoreboard players set #b.flame ci.ench 0
execute if score #b.flame ci.ench matches 1.. run scoreboard players set #applicable ci.tmp 1
scoreboard players operation #t.flame ci.ench = #c.flame ci.ench
execute if score #b.flame ci.ench > #t.flame ci.ench run scoreboard players operation #t.flame ci.ench = #b.flame ci.ench
execute if score #t.flame ci.ench > #c.flame ci.ench run scoreboard players add #upgrades ci.tmp 1
execute if score #t.flame ci.ench matches 2.. run scoreboard players set #overcap ci.tmp 1
execute if score #t.flame ci.ench > #c.flame ci.ench run scoreboard players operation #lvlsum ci.tmp += #t.flame ci.ench
execute if score #t.flame ci.ench > #c.flame ci.ench run scoreboard players operation #lvlsum ci.tmp -= #c.flame ci.ench
execute if score #b.fortune ci.ench matches 1.. if score #isbook ci.tmp matches 0 unless items entity @n[type=item,tag=ci_item,distance=..1.2] contents #minecraft:enchantable/mining_loot run scoreboard players set #b.fortune ci.ench 0
execute if score #b.fortune ci.ench matches 1.. run scoreboard players set #applicable ci.tmp 1
scoreboard players operation #t.fortune ci.ench = #c.fortune ci.ench
execute if score #b.fortune ci.ench > #t.fortune ci.ench run scoreboard players operation #t.fortune ci.ench = #b.fortune ci.ench
execute if score #t.fortune ci.ench > #c.fortune ci.ench run scoreboard players add #upgrades ci.tmp 1
execute if score #t.fortune ci.ench matches 4.. run scoreboard players set #overcap ci.tmp 1
execute if score #t.fortune ci.ench > #c.fortune ci.ench run scoreboard players operation #lvlsum ci.tmp += #t.fortune ci.ench
execute if score #t.fortune ci.ench > #c.fortune ci.ench run scoreboard players operation #lvlsum ci.tmp -= #c.fortune ci.ench
execute if score #b.frost_walker ci.ench matches 1.. if score #isbook ci.tmp matches 0 unless items entity @n[type=item,tag=ci_item,distance=..1.2] contents #minecraft:enchantable/foot_armor run scoreboard players set #b.frost_walker ci.ench 0
execute if score #b.frost_walker ci.ench matches 1.. run scoreboard players set #applicable ci.tmp 1
scoreboard players operation #t.frost_walker ci.ench = #c.frost_walker ci.ench
execute if score #b.frost_walker ci.ench > #t.frost_walker ci.ench run scoreboard players operation #t.frost_walker ci.ench = #b.frost_walker ci.ench
execute if score #t.frost_walker ci.ench > #c.frost_walker ci.ench run scoreboard players add #upgrades ci.tmp 1
execute if score #t.frost_walker ci.ench matches 3.. run scoreboard players set #overcap ci.tmp 1
execute if score #t.frost_walker ci.ench > #c.frost_walker ci.ench run scoreboard players operation #lvlsum ci.tmp += #t.frost_walker ci.ench
execute if score #t.frost_walker ci.ench > #c.frost_walker ci.ench run scoreboard players operation #lvlsum ci.tmp -= #c.frost_walker ci.ench
execute if score #b.impaling ci.ench matches 1.. if score #isbook ci.tmp matches 0 unless items entity @n[type=item,tag=ci_item,distance=..1.2] contents #minecraft:enchantable/trident run scoreboard players set #b.impaling ci.ench 0
execute if score #b.impaling ci.ench matches 1.. run scoreboard players set #applicable ci.tmp 1
scoreboard players operation #t.impaling ci.ench = #c.impaling ci.ench
execute if score #b.impaling ci.ench > #t.impaling ci.ench run scoreboard players operation #t.impaling ci.ench = #b.impaling ci.ench
execute if score #t.impaling ci.ench > #c.impaling ci.ench run scoreboard players add #upgrades ci.tmp 1
execute if score #t.impaling ci.ench matches 6.. run scoreboard players set #overcap ci.tmp 1
execute if score #t.impaling ci.ench > #c.impaling ci.ench run scoreboard players operation #lvlsum ci.tmp += #t.impaling ci.ench
execute if score #t.impaling ci.ench > #c.impaling ci.ench run scoreboard players operation #lvlsum ci.tmp -= #c.impaling ci.ench
execute if score #b.infinity ci.ench matches 1.. if score #isbook ci.tmp matches 0 unless items entity @n[type=item,tag=ci_item,distance=..1.2] contents #minecraft:enchantable/bow run scoreboard players set #b.infinity ci.ench 0
execute if score #b.infinity ci.ench matches 1.. run scoreboard players set #applicable ci.tmp 1
scoreboard players operation #t.infinity ci.ench = #c.infinity ci.ench
execute if score #b.infinity ci.ench > #t.infinity ci.ench run scoreboard players operation #t.infinity ci.ench = #b.infinity ci.ench
execute if score #t.infinity ci.ench > #c.infinity ci.ench run scoreboard players add #upgrades ci.tmp 1
execute if score #t.infinity ci.ench matches 2.. run scoreboard players set #overcap ci.tmp 1
execute if score #t.infinity ci.ench > #c.infinity ci.ench run scoreboard players operation #lvlsum ci.tmp += #t.infinity ci.ench
execute if score #t.infinity ci.ench > #c.infinity ci.ench run scoreboard players operation #lvlsum ci.tmp -= #c.infinity ci.ench
execute if score #b.knockback ci.ench matches 1.. if score #isbook ci.tmp matches 0 unless items entity @n[type=item,tag=ci_item,distance=..1.2] contents #minecraft:enchantable/melee_weapon run scoreboard players set #b.knockback ci.ench 0
execute if score #b.knockback ci.ench matches 1.. run scoreboard players set #applicable ci.tmp 1
scoreboard players operation #t.knockback ci.ench = #c.knockback ci.ench
execute if score #b.knockback ci.ench > #t.knockback ci.ench run scoreboard players operation #t.knockback ci.ench = #b.knockback ci.ench
execute if score #t.knockback ci.ench > #c.knockback ci.ench run scoreboard players add #upgrades ci.tmp 1
execute if score #t.knockback ci.ench matches 3.. run scoreboard players set #overcap ci.tmp 1
execute if score #t.knockback ci.ench > #c.knockback ci.ench run scoreboard players operation #lvlsum ci.tmp += #t.knockback ci.ench
execute if score #t.knockback ci.ench > #c.knockback ci.ench run scoreboard players operation #lvlsum ci.tmp -= #c.knockback ci.ench
execute if score #b.looting ci.ench matches 1.. if score #isbook ci.tmp matches 0 unless items entity @n[type=item,tag=ci_item,distance=..1.2] contents #minecraft:enchantable/melee_weapon run scoreboard players set #b.looting ci.ench 0
execute if score #b.looting ci.ench matches 1.. run scoreboard players set #applicable ci.tmp 1
scoreboard players operation #t.looting ci.ench = #c.looting ci.ench
execute if score #b.looting ci.ench > #t.looting ci.ench run scoreboard players operation #t.looting ci.ench = #b.looting ci.ench
execute if score #t.looting ci.ench > #c.looting ci.ench run scoreboard players add #upgrades ci.tmp 1
execute if score #t.looting ci.ench matches 4.. run scoreboard players set #overcap ci.tmp 1
execute if score #t.looting ci.ench > #c.looting ci.ench run scoreboard players operation #lvlsum ci.tmp += #t.looting ci.ench
execute if score #t.looting ci.ench > #c.looting ci.ench run scoreboard players operation #lvlsum ci.tmp -= #c.looting ci.ench
execute if score #b.loyalty ci.ench matches 1.. if score #isbook ci.tmp matches 0 unless items entity @n[type=item,tag=ci_item,distance=..1.2] contents #minecraft:enchantable/trident run scoreboard players set #b.loyalty ci.ench 0
execute if score #b.loyalty ci.ench matches 1.. run scoreboard players set #applicable ci.tmp 1
scoreboard players operation #t.loyalty ci.ench = #c.loyalty ci.ench
execute if score #b.loyalty ci.ench > #t.loyalty ci.ench run scoreboard players operation #t.loyalty ci.ench = #b.loyalty ci.ench
execute if score #t.loyalty ci.ench > #c.loyalty ci.ench run scoreboard players add #upgrades ci.tmp 1
execute if score #t.loyalty ci.ench matches 4.. run scoreboard players set #overcap ci.tmp 1
execute if score #t.loyalty ci.ench > #c.loyalty ci.ench run scoreboard players operation #lvlsum ci.tmp += #t.loyalty ci.ench
execute if score #t.loyalty ci.ench > #c.loyalty ci.ench run scoreboard players operation #lvlsum ci.tmp -= #c.loyalty ci.ench
execute if score #b.luck_of_the_sea ci.ench matches 1.. if score #isbook ci.tmp matches 0 unless items entity @n[type=item,tag=ci_item,distance=..1.2] contents #minecraft:enchantable/fishing run scoreboard players set #b.luck_of_the_sea ci.ench 0
execute if score #b.luck_of_the_sea ci.ench matches 1.. run scoreboard players set #applicable ci.tmp 1
scoreboard players operation #t.luck_of_the_sea ci.ench = #c.luck_of_the_sea ci.ench
execute if score #b.luck_of_the_sea ci.ench > #t.luck_of_the_sea ci.ench run scoreboard players operation #t.luck_of_the_sea ci.ench = #b.luck_of_the_sea ci.ench
execute if score #t.luck_of_the_sea ci.ench > #c.luck_of_the_sea ci.ench run scoreboard players add #upgrades ci.tmp 1
execute if score #t.luck_of_the_sea ci.ench matches 4.. run scoreboard players set #overcap ci.tmp 1
execute if score #t.luck_of_the_sea ci.ench > #c.luck_of_the_sea ci.ench run scoreboard players operation #lvlsum ci.tmp += #t.luck_of_the_sea ci.ench
execute if score #t.luck_of_the_sea ci.ench > #c.luck_of_the_sea ci.ench run scoreboard players operation #lvlsum ci.tmp -= #c.luck_of_the_sea ci.ench
execute if score #b.lure ci.ench matches 1.. if score #isbook ci.tmp matches 0 unless items entity @n[type=item,tag=ci_item,distance=..1.2] contents #minecraft:enchantable/fishing run scoreboard players set #b.lure ci.ench 0
execute if score #b.lure ci.ench matches 1.. run scoreboard players set #applicable ci.tmp 1
scoreboard players operation #t.lure ci.ench = #c.lure ci.ench
execute if score #b.lure ci.ench > #t.lure ci.ench run scoreboard players operation #t.lure ci.ench = #b.lure ci.ench
execute if score #t.lure ci.ench > #c.lure ci.ench run scoreboard players add #upgrades ci.tmp 1
execute if score #t.lure ci.ench matches 4.. run scoreboard players set #overcap ci.tmp 1
execute if score #t.lure ci.ench > #c.lure ci.ench run scoreboard players operation #lvlsum ci.tmp += #t.lure ci.ench
execute if score #t.lure ci.ench > #c.lure ci.ench run scoreboard players operation #lvlsum ci.tmp -= #c.lure ci.ench
execute if score #b.mending ci.ench matches 1.. if score #isbook ci.tmp matches 0 unless items entity @n[type=item,tag=ci_item,distance=..1.2] contents #minecraft:enchantable/durability run scoreboard players set #b.mending ci.ench 0
execute if score #b.mending ci.ench matches 1.. run scoreboard players set #applicable ci.tmp 1
scoreboard players operation #t.mending ci.ench = #c.mending ci.ench
execute if score #b.mending ci.ench > #t.mending ci.ench run scoreboard players operation #t.mending ci.ench = #b.mending ci.ench
execute if score #t.mending ci.ench > #c.mending ci.ench run scoreboard players add #upgrades ci.tmp 1
execute if score #t.mending ci.ench matches 2.. run scoreboard players set #overcap ci.tmp 1
execute if score #t.mending ci.ench > #c.mending ci.ench run scoreboard players operation #lvlsum ci.tmp += #t.mending ci.ench
execute if score #t.mending ci.ench > #c.mending ci.ench run scoreboard players operation #lvlsum ci.tmp -= #c.mending ci.ench
execute if score #b.multishot ci.ench matches 1.. if score #isbook ci.tmp matches 0 unless items entity @n[type=item,tag=ci_item,distance=..1.2] contents #minecraft:enchantable/crossbow run scoreboard players set #b.multishot ci.ench 0
execute if score #b.multishot ci.ench matches 1.. run scoreboard players set #applicable ci.tmp 1
scoreboard players operation #t.multishot ci.ench = #c.multishot ci.ench
execute if score #b.multishot ci.ench > #t.multishot ci.ench run scoreboard players operation #t.multishot ci.ench = #b.multishot ci.ench
execute if score #t.multishot ci.ench > #c.multishot ci.ench run scoreboard players add #upgrades ci.tmp 1
execute if score #t.multishot ci.ench matches 2.. run scoreboard players set #overcap ci.tmp 1
execute if score #t.multishot ci.ench > #c.multishot ci.ench run scoreboard players operation #lvlsum ci.tmp += #t.multishot ci.ench
execute if score #t.multishot ci.ench > #c.multishot ci.ench run scoreboard players operation #lvlsum ci.tmp -= #c.multishot ci.ench
execute if score #b.piercing ci.ench matches 1.. if score #isbook ci.tmp matches 0 unless items entity @n[type=item,tag=ci_item,distance=..1.2] contents #minecraft:enchantable/crossbow run scoreboard players set #b.piercing ci.ench 0
execute if score #b.piercing ci.ench matches 1.. run scoreboard players set #applicable ci.tmp 1
scoreboard players operation #t.piercing ci.ench = #c.piercing ci.ench
execute if score #b.piercing ci.ench > #t.piercing ci.ench run scoreboard players operation #t.piercing ci.ench = #b.piercing ci.ench
execute if score #t.piercing ci.ench > #c.piercing ci.ench run scoreboard players add #upgrades ci.tmp 1
execute if score #t.piercing ci.ench matches 5.. run scoreboard players set #overcap ci.tmp 1
execute if score #t.piercing ci.ench > #c.piercing ci.ench run scoreboard players operation #lvlsum ci.tmp += #t.piercing ci.ench
execute if score #t.piercing ci.ench > #c.piercing ci.ench run scoreboard players operation #lvlsum ci.tmp -= #c.piercing ci.ench
execute if score #b.power ci.ench matches 1.. if score #isbook ci.tmp matches 0 unless items entity @n[type=item,tag=ci_item,distance=..1.2] contents #minecraft:enchantable/bow run scoreboard players set #b.power ci.ench 0
execute if score #b.power ci.ench matches 1.. run scoreboard players set #applicable ci.tmp 1
scoreboard players operation #t.power ci.ench = #c.power ci.ench
execute if score #b.power ci.ench > #t.power ci.ench run scoreboard players operation #t.power ci.ench = #b.power ci.ench
execute if score #t.power ci.ench > #c.power ci.ench run scoreboard players add #upgrades ci.tmp 1
execute if score #t.power ci.ench matches 6.. run scoreboard players set #overcap ci.tmp 1
execute if score #t.power ci.ench > #c.power ci.ench run scoreboard players operation #lvlsum ci.tmp += #t.power ci.ench
execute if score #t.power ci.ench > #c.power ci.ench run scoreboard players operation #lvlsum ci.tmp -= #c.power ci.ench
execute if score #b.projectile_protection ci.ench matches 1.. if score #isbook ci.tmp matches 0 unless items entity @n[type=item,tag=ci_item,distance=..1.2] contents #minecraft:enchantable/armor run scoreboard players set #b.projectile_protection ci.ench 0
execute if score #b.projectile_protection ci.ench matches 1.. run scoreboard players set #applicable ci.tmp 1
scoreboard players operation #t.projectile_protection ci.ench = #c.projectile_protection ci.ench
execute if score #b.projectile_protection ci.ench > #t.projectile_protection ci.ench run scoreboard players operation #t.projectile_protection ci.ench = #b.projectile_protection ci.ench
execute if score #t.projectile_protection ci.ench > #c.projectile_protection ci.ench run scoreboard players add #upgrades ci.tmp 1
execute if score #t.projectile_protection ci.ench matches 5.. run scoreboard players set #overcap ci.tmp 1
execute if score #t.projectile_protection ci.ench > #c.projectile_protection ci.ench run scoreboard players operation #lvlsum ci.tmp += #t.projectile_protection ci.ench
execute if score #t.projectile_protection ci.ench > #c.projectile_protection ci.ench run scoreboard players operation #lvlsum ci.tmp -= #c.projectile_protection ci.ench
execute if score #b.protection ci.ench matches 1.. if score #isbook ci.tmp matches 0 unless items entity @n[type=item,tag=ci_item,distance=..1.2] contents #minecraft:enchantable/armor run scoreboard players set #b.protection ci.ench 0
execute if score #b.protection ci.ench matches 1.. run scoreboard players set #applicable ci.tmp 1
scoreboard players operation #t.protection ci.ench = #c.protection ci.ench
execute if score #b.protection ci.ench > #t.protection ci.ench run scoreboard players operation #t.protection ci.ench = #b.protection ci.ench
execute if score #t.protection ci.ench > #c.protection ci.ench run scoreboard players add #upgrades ci.tmp 1
execute if score #t.protection ci.ench matches 5.. run scoreboard players set #overcap ci.tmp 1
execute if score #t.protection ci.ench > #c.protection ci.ench run scoreboard players operation #lvlsum ci.tmp += #t.protection ci.ench
execute if score #t.protection ci.ench > #c.protection ci.ench run scoreboard players operation #lvlsum ci.tmp -= #c.protection ci.ench
execute if score #b.punch ci.ench matches 1.. if score #isbook ci.tmp matches 0 unless items entity @n[type=item,tag=ci_item,distance=..1.2] contents #minecraft:enchantable/bow run scoreboard players set #b.punch ci.ench 0
execute if score #b.punch ci.ench matches 1.. run scoreboard players set #applicable ci.tmp 1
scoreboard players operation #t.punch ci.ench = #c.punch ci.ench
execute if score #b.punch ci.ench > #t.punch ci.ench run scoreboard players operation #t.punch ci.ench = #b.punch ci.ench
execute if score #t.punch ci.ench > #c.punch ci.ench run scoreboard players add #upgrades ci.tmp 1
execute if score #t.punch ci.ench matches 3.. run scoreboard players set #overcap ci.tmp 1
execute if score #t.punch ci.ench > #c.punch ci.ench run scoreboard players operation #lvlsum ci.tmp += #t.punch ci.ench
execute if score #t.punch ci.ench > #c.punch ci.ench run scoreboard players operation #lvlsum ci.tmp -= #c.punch ci.ench
execute if score #b.quick_charge ci.ench matches 1.. if score #isbook ci.tmp matches 0 unless items entity @n[type=item,tag=ci_item,distance=..1.2] contents #minecraft:enchantable/crossbow run scoreboard players set #b.quick_charge ci.ench 0
execute if score #b.quick_charge ci.ench matches 1.. run scoreboard players set #applicable ci.tmp 1
scoreboard players operation #t.quick_charge ci.ench = #c.quick_charge ci.ench
execute if score #b.quick_charge ci.ench > #t.quick_charge ci.ench run scoreboard players operation #t.quick_charge ci.ench = #b.quick_charge ci.ench
execute if score #t.quick_charge ci.ench > #c.quick_charge ci.ench run scoreboard players add #upgrades ci.tmp 1
execute if score #t.quick_charge ci.ench matches 4.. run scoreboard players set #overcap ci.tmp 1
execute if score #t.quick_charge ci.ench > #c.quick_charge ci.ench run scoreboard players operation #lvlsum ci.tmp += #t.quick_charge ci.ench
execute if score #t.quick_charge ci.ench > #c.quick_charge ci.ench run scoreboard players operation #lvlsum ci.tmp -= #c.quick_charge ci.ench
execute if score #b.respiration ci.ench matches 1.. if score #isbook ci.tmp matches 0 unless items entity @n[type=item,tag=ci_item,distance=..1.2] contents #minecraft:enchantable/head_armor run scoreboard players set #b.respiration ci.ench 0
execute if score #b.respiration ci.ench matches 1.. run scoreboard players set #applicable ci.tmp 1
scoreboard players operation #t.respiration ci.ench = #c.respiration ci.ench
execute if score #b.respiration ci.ench > #t.respiration ci.ench run scoreboard players operation #t.respiration ci.ench = #b.respiration ci.ench
execute if score #t.respiration ci.ench > #c.respiration ci.ench run scoreboard players add #upgrades ci.tmp 1
execute if score #t.respiration ci.ench matches 4.. run scoreboard players set #overcap ci.tmp 1
execute if score #t.respiration ci.ench > #c.respiration ci.ench run scoreboard players operation #lvlsum ci.tmp += #t.respiration ci.ench
execute if score #t.respiration ci.ench > #c.respiration ci.ench run scoreboard players operation #lvlsum ci.tmp -= #c.respiration ci.ench
execute if score #b.riptide ci.ench matches 1.. if score #isbook ci.tmp matches 0 unless items entity @n[type=item,tag=ci_item,distance=..1.2] contents #minecraft:enchantable/trident run scoreboard players set #b.riptide ci.ench 0
execute if score #b.riptide ci.ench matches 1.. run scoreboard players set #applicable ci.tmp 1
scoreboard players operation #t.riptide ci.ench = #c.riptide ci.ench
execute if score #b.riptide ci.ench > #t.riptide ci.ench run scoreboard players operation #t.riptide ci.ench = #b.riptide ci.ench
execute if score #t.riptide ci.ench > #c.riptide ci.ench run scoreboard players add #upgrades ci.tmp 1
execute if score #t.riptide ci.ench matches 4.. run scoreboard players set #overcap ci.tmp 1
execute if score #t.riptide ci.ench > #c.riptide ci.ench run scoreboard players operation #lvlsum ci.tmp += #t.riptide ci.ench
execute if score #t.riptide ci.ench > #c.riptide ci.ench run scoreboard players operation #lvlsum ci.tmp -= #c.riptide ci.ench
execute if score #b.sharpness ci.ench matches 1.. if score #isbook ci.tmp matches 0 unless items entity @n[type=item,tag=ci_item,distance=..1.2] contents #minecraft:enchantable/sharp_weapon run scoreboard players set #b.sharpness ci.ench 0
execute if score #b.sharpness ci.ench matches 1.. run scoreboard players set #applicable ci.tmp 1
scoreboard players operation #t.sharpness ci.ench = #c.sharpness ci.ench
execute if score #b.sharpness ci.ench > #t.sharpness ci.ench run scoreboard players operation #t.sharpness ci.ench = #b.sharpness ci.ench
execute if score #t.sharpness ci.ench > #c.sharpness ci.ench run scoreboard players add #upgrades ci.tmp 1
execute if score #t.sharpness ci.ench matches 6.. run scoreboard players set #overcap ci.tmp 1
execute if score #t.sharpness ci.ench > #c.sharpness ci.ench run scoreboard players operation #lvlsum ci.tmp += #t.sharpness ci.ench
execute if score #t.sharpness ci.ench > #c.sharpness ci.ench run scoreboard players operation #lvlsum ci.tmp -= #c.sharpness ci.ench
execute if score #b.silk_touch ci.ench matches 1.. if score #isbook ci.tmp matches 0 unless items entity @n[type=item,tag=ci_item,distance=..1.2] contents #minecraft:enchantable/mining_loot run scoreboard players set #b.silk_touch ci.ench 0
execute if score #b.silk_touch ci.ench matches 1.. run scoreboard players set #applicable ci.tmp 1
scoreboard players operation #t.silk_touch ci.ench = #c.silk_touch ci.ench
execute if score #b.silk_touch ci.ench > #t.silk_touch ci.ench run scoreboard players operation #t.silk_touch ci.ench = #b.silk_touch ci.ench
execute if score #t.silk_touch ci.ench > #c.silk_touch ci.ench run scoreboard players add #upgrades ci.tmp 1
execute if score #t.silk_touch ci.ench matches 2.. run scoreboard players set #overcap ci.tmp 1
execute if score #t.silk_touch ci.ench > #c.silk_touch ci.ench run scoreboard players operation #lvlsum ci.tmp += #t.silk_touch ci.ench
execute if score #t.silk_touch ci.ench > #c.silk_touch ci.ench run scoreboard players operation #lvlsum ci.tmp -= #c.silk_touch ci.ench
execute if score #b.smite ci.ench matches 1.. if score #isbook ci.tmp matches 0 unless items entity @n[type=item,tag=ci_item,distance=..1.2] contents #minecraft:enchantable/weapon run scoreboard players set #b.smite ci.ench 0
execute if score #b.smite ci.ench matches 1.. run scoreboard players set #applicable ci.tmp 1
scoreboard players operation #t.smite ci.ench = #c.smite ci.ench
execute if score #b.smite ci.ench > #t.smite ci.ench run scoreboard players operation #t.smite ci.ench = #b.smite ci.ench
execute if score #t.smite ci.ench > #c.smite ci.ench run scoreboard players add #upgrades ci.tmp 1
execute if score #t.smite ci.ench matches 6.. run scoreboard players set #overcap ci.tmp 1
execute if score #t.smite ci.ench > #c.smite ci.ench run scoreboard players operation #lvlsum ci.tmp += #t.smite ci.ench
execute if score #t.smite ci.ench > #c.smite ci.ench run scoreboard players operation #lvlsum ci.tmp -= #c.smite ci.ench
execute if score #b.soul_speed ci.ench matches 1.. if score #isbook ci.tmp matches 0 unless items entity @n[type=item,tag=ci_item,distance=..1.2] contents #minecraft:enchantable/foot_armor run scoreboard players set #b.soul_speed ci.ench 0
execute if score #b.soul_speed ci.ench matches 1.. run scoreboard players set #applicable ci.tmp 1
scoreboard players operation #t.soul_speed ci.ench = #c.soul_speed ci.ench
execute if score #b.soul_speed ci.ench > #t.soul_speed ci.ench run scoreboard players operation #t.soul_speed ci.ench = #b.soul_speed ci.ench
execute if score #t.soul_speed ci.ench > #c.soul_speed ci.ench run scoreboard players add #upgrades ci.tmp 1
execute if score #t.soul_speed ci.ench matches 4.. run scoreboard players set #overcap ci.tmp 1
execute if score #t.soul_speed ci.ench > #c.soul_speed ci.ench run scoreboard players operation #lvlsum ci.tmp += #t.soul_speed ci.ench
execute if score #t.soul_speed ci.ench > #c.soul_speed ci.ench run scoreboard players operation #lvlsum ci.tmp -= #c.soul_speed ci.ench
execute if score #b.sweeping_edge ci.ench matches 1.. if score #isbook ci.tmp matches 0 unless items entity @n[type=item,tag=ci_item,distance=..1.2] contents #minecraft:enchantable/sweeping run scoreboard players set #b.sweeping_edge ci.ench 0
execute if score #b.sweeping_edge ci.ench matches 1.. run scoreboard players set #applicable ci.tmp 1
scoreboard players operation #t.sweeping_edge ci.ench = #c.sweeping_edge ci.ench
execute if score #b.sweeping_edge ci.ench > #t.sweeping_edge ci.ench run scoreboard players operation #t.sweeping_edge ci.ench = #b.sweeping_edge ci.ench
execute if score #t.sweeping_edge ci.ench > #c.sweeping_edge ci.ench run scoreboard players add #upgrades ci.tmp 1
execute if score #t.sweeping_edge ci.ench matches 4.. run scoreboard players set #overcap ci.tmp 1
execute if score #t.sweeping_edge ci.ench > #c.sweeping_edge ci.ench run scoreboard players operation #lvlsum ci.tmp += #t.sweeping_edge ci.ench
execute if score #t.sweeping_edge ci.ench > #c.sweeping_edge ci.ench run scoreboard players operation #lvlsum ci.tmp -= #c.sweeping_edge ci.ench
execute if score #b.swift_sneak ci.ench matches 1.. if score #isbook ci.tmp matches 0 unless items entity @n[type=item,tag=ci_item,distance=..1.2] contents #minecraft:enchantable/leg_armor run scoreboard players set #b.swift_sneak ci.ench 0
execute if score #b.swift_sneak ci.ench matches 1.. run scoreboard players set #applicable ci.tmp 1
scoreboard players operation #t.swift_sneak ci.ench = #c.swift_sneak ci.ench
execute if score #b.swift_sneak ci.ench > #t.swift_sneak ci.ench run scoreboard players operation #t.swift_sneak ci.ench = #b.swift_sneak ci.ench
execute if score #t.swift_sneak ci.ench > #c.swift_sneak ci.ench run scoreboard players add #upgrades ci.tmp 1
execute if score #t.swift_sneak ci.ench matches 4.. run scoreboard players set #overcap ci.tmp 1
execute if score #t.swift_sneak ci.ench > #c.swift_sneak ci.ench run scoreboard players operation #lvlsum ci.tmp += #t.swift_sneak ci.ench
execute if score #t.swift_sneak ci.ench > #c.swift_sneak ci.ench run scoreboard players operation #lvlsum ci.tmp -= #c.swift_sneak ci.ench
execute if score #b.thorns ci.ench matches 1.. if score #isbook ci.tmp matches 0 unless items entity @n[type=item,tag=ci_item,distance=..1.2] contents #minecraft:enchantable/armor run scoreboard players set #b.thorns ci.ench 0
execute if score #b.thorns ci.ench matches 1.. run scoreboard players set #applicable ci.tmp 1
scoreboard players operation #t.thorns ci.ench = #c.thorns ci.ench
execute if score #b.thorns ci.ench > #t.thorns ci.ench run scoreboard players operation #t.thorns ci.ench = #b.thorns ci.ench
execute if score #t.thorns ci.ench > #c.thorns ci.ench run scoreboard players add #upgrades ci.tmp 1
execute if score #t.thorns ci.ench matches 4.. run scoreboard players set #overcap ci.tmp 1
execute if score #t.thorns ci.ench > #c.thorns ci.ench run scoreboard players operation #lvlsum ci.tmp += #t.thorns ci.ench
execute if score #t.thorns ci.ench > #c.thorns ci.ench run scoreboard players operation #lvlsum ci.tmp -= #c.thorns ci.ench
execute if score #b.unbreaking ci.ench matches 1.. if score #isbook ci.tmp matches 0 unless items entity @n[type=item,tag=ci_item,distance=..1.2] contents #minecraft:enchantable/durability run scoreboard players set #b.unbreaking ci.ench 0
execute if score #b.unbreaking ci.ench matches 1.. run scoreboard players set #applicable ci.tmp 1
scoreboard players operation #t.unbreaking ci.ench = #c.unbreaking ci.ench
execute if score #b.unbreaking ci.ench > #t.unbreaking ci.ench run scoreboard players operation #t.unbreaking ci.ench = #b.unbreaking ci.ench
execute if score #t.unbreaking ci.ench > #c.unbreaking ci.ench run scoreboard players add #upgrades ci.tmp 1
execute if score #t.unbreaking ci.ench matches 4.. run scoreboard players set #overcap ci.tmp 1
execute if score #t.unbreaking ci.ench > #c.unbreaking ci.ench run scoreboard players operation #lvlsum ci.tmp += #t.unbreaking ci.ench
execute if score #t.unbreaking ci.ench > #c.unbreaking ci.ench run scoreboard players operation #lvlsum ci.tmp -= #c.unbreaking ci.ench
execute if score #b.vanishing_curse ci.ench matches 1.. if score #isbook ci.tmp matches 0 unless items entity @n[type=item,tag=ci_item,distance=..1.2] contents #minecraft:enchantable/vanishing run scoreboard players set #b.vanishing_curse ci.ench 0
execute if score #b.vanishing_curse ci.ench matches 1.. run scoreboard players set #applicable ci.tmp 1
scoreboard players operation #t.vanishing_curse ci.ench = #c.vanishing_curse ci.ench
execute if score #b.vanishing_curse ci.ench > #t.vanishing_curse ci.ench run scoreboard players operation #t.vanishing_curse ci.ench = #b.vanishing_curse ci.ench
execute if score #t.vanishing_curse ci.ench > #c.vanishing_curse ci.ench run scoreboard players add #upgrades ci.tmp 1
execute if score #t.vanishing_curse ci.ench matches 2.. run scoreboard players set #overcap ci.tmp 1
execute if score #t.vanishing_curse ci.ench > #c.vanishing_curse ci.ench run scoreboard players operation #lvlsum ci.tmp += #t.vanishing_curse ci.ench
execute if score #t.vanishing_curse ci.ench > #c.vanishing_curse ci.ench run scoreboard players operation #lvlsum ci.tmp -= #c.vanishing_curse ci.ench
execute if score #b.wind_burst ci.ench matches 1.. if score #isbook ci.tmp matches 0 unless items entity @n[type=item,tag=ci_item,distance=..1.2] contents #minecraft:enchantable/mace run scoreboard players set #b.wind_burst ci.ench 0
execute if score #b.wind_burst ci.ench matches 1.. run scoreboard players set #applicable ci.tmp 1
scoreboard players operation #t.wind_burst ci.ench = #c.wind_burst ci.ench
execute if score #b.wind_burst ci.ench > #t.wind_burst ci.ench run scoreboard players operation #t.wind_burst ci.ench = #b.wind_burst ci.ench
execute if score #t.wind_burst ci.ench > #c.wind_burst ci.ench run scoreboard players add #upgrades ci.tmp 1
execute if score #t.wind_burst ci.ench matches 4.. run scoreboard players set #overcap ci.tmp 1
execute if score #t.wind_burst ci.ench > #c.wind_burst ci.ench run scoreboard players operation #lvlsum ci.tmp += #t.wind_burst ci.ench
execute if score #t.wind_burst ci.ench > #c.wind_burst ci.ench run scoreboard players operation #lvlsum ci.tmp -= #c.wind_burst ci.ench
execute if score #t.sharpness ci.ench matches 1.. if score #t.smite ci.ench matches 1.. run scoreboard players set #incompat ci.tmp 1
execute if score #t.sharpness ci.ench matches 1.. if score #t.bane_of_arthropods ci.ench matches 1.. run scoreboard players set #incompat ci.tmp 1
execute if score #t.sharpness ci.ench matches 1.. if score #t.impaling ci.ench matches 1.. run scoreboard players set #incompat ci.tmp 1
execute if score #t.sharpness ci.ench matches 1.. if score #t.density ci.ench matches 1.. run scoreboard players set #incompat ci.tmp 1
execute if score #t.sharpness ci.ench matches 1.. if score #t.breach ci.ench matches 1.. run scoreboard players set #incompat ci.tmp 1
execute if score #t.smite ci.ench matches 1.. if score #t.bane_of_arthropods ci.ench matches 1.. run scoreboard players set #incompat ci.tmp 1
execute if score #t.smite ci.ench matches 1.. if score #t.impaling ci.ench matches 1.. run scoreboard players set #incompat ci.tmp 1
execute if score #t.smite ci.ench matches 1.. if score #t.density ci.ench matches 1.. run scoreboard players set #incompat ci.tmp 1
execute if score #t.smite ci.ench matches 1.. if score #t.breach ci.ench matches 1.. run scoreboard players set #incompat ci.tmp 1
execute if score #t.bane_of_arthropods ci.ench matches 1.. if score #t.impaling ci.ench matches 1.. run scoreboard players set #incompat ci.tmp 1
execute if score #t.bane_of_arthropods ci.ench matches 1.. if score #t.density ci.ench matches 1.. run scoreboard players set #incompat ci.tmp 1
execute if score #t.bane_of_arthropods ci.ench matches 1.. if score #t.breach ci.ench matches 1.. run scoreboard players set #incompat ci.tmp 1
execute if score #t.impaling ci.ench matches 1.. if score #t.density ci.ench matches 1.. run scoreboard players set #incompat ci.tmp 1
execute if score #t.impaling ci.ench matches 1.. if score #t.breach ci.ench matches 1.. run scoreboard players set #incompat ci.tmp 1
execute if score #t.density ci.ench matches 1.. if score #t.breach ci.ench matches 1.. run scoreboard players set #incompat ci.tmp 1
execute if score #t.protection ci.ench matches 1.. if score #t.blast_protection ci.ench matches 1.. run scoreboard players set #incompat ci.tmp 1
execute if score #t.protection ci.ench matches 1.. if score #t.fire_protection ci.ench matches 1.. run scoreboard players set #incompat ci.tmp 1
execute if score #t.protection ci.ench matches 1.. if score #t.projectile_protection ci.ench matches 1.. run scoreboard players set #incompat ci.tmp 1
execute if score #t.blast_protection ci.ench matches 1.. if score #t.fire_protection ci.ench matches 1.. run scoreboard players set #incompat ci.tmp 1
execute if score #t.blast_protection ci.ench matches 1.. if score #t.projectile_protection ci.ench matches 1.. run scoreboard players set #incompat ci.tmp 1
execute if score #t.fire_protection ci.ench matches 1.. if score #t.projectile_protection ci.ench matches 1.. run scoreboard players set #incompat ci.tmp 1
execute if score #t.depth_strider ci.ench matches 1.. if score #t.frost_walker ci.ench matches 1.. run scoreboard players set #incompat ci.tmp 1
execute if score #t.silk_touch ci.ench matches 1.. if score #t.fortune ci.ench matches 1.. run scoreboard players set #incompat ci.tmp 1
execute if score #t.infinity ci.ench matches 1.. if score #t.mending ci.ench matches 1.. run scoreboard players set #incompat ci.tmp 1
execute if score #t.multishot ci.ench matches 1.. if score #t.piercing ci.ench matches 1.. run scoreboard players set #incompat ci.tmp 1
execute if score #t.loyalty ci.ench matches 1.. if score #t.channeling ci.ench matches 1.. run scoreboard players set #incompat ci.tmp 1
scoreboard players operation #cost ci.tmp = #lvlsum ci.tmp
scoreboard players operation #cost ci.tmp *= #xp ci.cfg
scoreboard players operation #cat ci.tmp = #upgrades ci.tmp
scoreboard players operation #cat ci.tmp *= #lapis ci.cfg
execute if score #maxxp ci.cfg matches 1.. if score #cost ci.tmp > #maxxp ci.cfg run scoreboard players operation #cost ci.tmp = #maxxp ci.cfg
scoreboard players operation #maxp ci.tmp = #shelf ci.tmp
scoreboard players operation #maxp ci.tmp *= #two ci.tmp
execute if score #shelf ci.tmp matches 15.. run scoreboard players set #maxp ci.tmp 999999
scoreboard players operation #need ci.tmp = #cost ci.tmp
scoreboard players add #need ci.tmp 1
scoreboard players operation #need ci.tmp /= #two ci.tmp
execute if score #need ci.tmp matches 16.. run scoreboard players set #need ci.tmp 15
execute if score #books ci.tmp matches 0 run scoreboard players set #fail ci.tmp 1
execute if score #fail ci.tmp matches 0 if score #applicable ci.tmp matches 0 run scoreboard players set #fail ci.tmp 2
execute if score #fail ci.tmp matches 0 if score #upgrades ci.tmp matches 0 run scoreboard players set #fail ci.tmp 3
execute if score #fail ci.tmp matches 0 if score #creative ci.tmp matches 0 if score #cost ci.tmp > #maxp ci.tmp run scoreboard players set #fail ci.tmp 4
execute if score #fail ci.tmp matches 0 if score #cry ci.tmp matches 0 if score #overcap ci.tmp matches 1 run scoreboard players set #fail ci.tmp 5
execute if score #fail ci.tmp matches 0 if score #cry ci.tmp matches 0 if score #incompat ci.tmp matches 1 run scoreboard players set #fail ci.tmp 5
execute if score #fail ci.tmp matches 0 if score #creative ci.tmp matches 0 if score #pl ci.tmp < #cost ci.tmp if score #catc ci.tmp < #cat ci.tmp run scoreboard players set #fail ci.tmp 6
execute if score #fail ci.tmp matches 0 if score #creative ci.tmp matches 0 if score #pl ci.tmp < #cost ci.tmp run scoreboard players set #fail ci.tmp 7
execute if score #fail ci.tmp matches 0 if score #creative ci.tmp matches 0 if score #catc ci.tmp < #cat ci.tmp run scoreboard players set #fail ci.tmp 8
