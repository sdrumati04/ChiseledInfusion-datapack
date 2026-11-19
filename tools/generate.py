"""Generates the repetitive parts of the Chiseled Infusion datapack.

Run:  python tools/generate.py
Every generated file is overwritten. Hand-written functions in tools/static.py
are written too, so this script is the single source of truth for the pack.
"""
import os

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
FN = os.path.join(ROOT, "data", "chiseledinfusion", "function")
if os.path.isdir(FN):
    import shutil
    shutil.rmtree(FN)

# id max_level supported_items (mirrors the vanilla enchantment registry)
ENCH_RAW = """
aqua_affinity 1 #minecraft:enchantable/head_armor
bane_of_arthropods 5 #minecraft:enchantable/weapon
binding_curse 1 #minecraft:enchantable/equippable
blast_protection 4 #minecraft:enchantable/armor
breach 4 #minecraft:enchantable/mace
channeling 1 #minecraft:enchantable/trident
density 5 #minecraft:enchantable/mace
depth_strider 3 #minecraft:enchantable/foot_armor
efficiency 5 #minecraft:enchantable/mining
feather_falling 4 #minecraft:enchantable/foot_armor
fire_aspect 2 #minecraft:enchantable/fire_aspect
fire_protection 4 #minecraft:enchantable/armor
flame 1 #minecraft:enchantable/bow
fortune 3 #minecraft:enchantable/mining_loot
frost_walker 2 #minecraft:enchantable/foot_armor
impaling 5 #minecraft:enchantable/trident
infinity 1 #minecraft:enchantable/bow
knockback 2 #minecraft:enchantable/melee_weapon
looting 3 #minecraft:enchantable/melee_weapon
loyalty 3 #minecraft:enchantable/trident
luck_of_the_sea 3 #minecraft:enchantable/fishing
lure 3 #minecraft:enchantable/fishing
mending 1 #minecraft:enchantable/durability
multishot 1 #minecraft:enchantable/crossbow
piercing 4 #minecraft:enchantable/crossbow
power 5 #minecraft:enchantable/bow
projectile_protection 4 #minecraft:enchantable/armor
protection 4 #minecraft:enchantable/armor
punch 2 #minecraft:enchantable/bow
quick_charge 3 #minecraft:enchantable/crossbow
respiration 3 #minecraft:enchantable/head_armor
riptide 3 #minecraft:enchantable/trident
sharpness 5 #minecraft:enchantable/sharp_weapon
silk_touch 1 #minecraft:enchantable/mining_loot
smite 5 #minecraft:enchantable/weapon
soul_speed 3 #minecraft:enchantable/foot_armor
sweeping_edge 3 #minecraft:enchantable/sweeping
swift_sneak 3 #minecraft:enchantable/leg_armor
thorns 3 #minecraft:enchantable/armor
unbreaking 3 #minecraft:enchantable/durability
vanishing_curse 1 #minecraft:enchantable/vanishing
wind_burst 3 #minecraft:enchantable/mace
"""

EXCLUSIVE = {
    "damage": ["sharpness", "smite", "bane_of_arthropods", "impaling", "density", "breach"],
    "armor": ["protection", "blast_protection", "fire_protection", "projectile_protection"],
    "boots": ["depth_strider", "frost_walker"],
    "mining": ["silk_touch", "fortune"],
    "bow": ["infinity", "mending"],
    "crossbow": ["multishot", "piercing"],
    "riptide": ["loyalty", "channeling"],
}

E = []
for line in ENCH_RAW.strip().splitlines():
    i, m, t = line.split()
    E.append((i, int(m), t))


def write(rel, lines):
    p = os.path.join(FN, rel.replace("/", os.sep) + ".mcfunction")
    os.makedirs(os.path.dirname(p), exist_ok=True)
    with open(p, "w", encoding="utf-8", newline="\n") as f:
        f.write("\n".join(lines) + "\n")


# ---------------------------------------------------------------- reset
L = ["scoreboard players set #%s ci.tmp 0" % v for v in (
    "books", "applicable", "upgrades", "lvlsum", "cost", "cat", "need",
    "maxp", "shelf", "fail", "cry", "incompat", "overcap", "isbook", "isrb",
    "lvl", "list", "pl", "catc", "creative", "d")]
L += ["scoreboard players set #b.%s ci.ench 0" % i for i, _, _ in E]
write("scan/reset", L)

# ---------------------------------------------------------------- current
L = []
for i, _, _ in E:
    eb = 'item.components."minecraft:stored_enchantments"."minecraft:%s"' % i
    en = 'item.components."minecraft:enchantments"."minecraft:%s"' % i
    L.append("scoreboard players set #c.%s ci.ench 0" % i)
    L.append("execute if score #isrb ci.tmp matches 1 store result score #c.%s "
             "ci.ench run data get storage ci:tmp %s" % (i, eb))
    L.append("execute if score #isrb ci.tmp matches 0 store result score #c.%s "
             "ci.ench run data get storage ci:tmp %s" % (i, en))
write("scan/current", L)

# ---------------------------------------------------------------- book_levels
L = []
for i, _, _ in E:
    p = 'storage ci:tmp book.components."minecraft:stored_enchantments"."minecraft:%s"' % i
    L.append("scoreboard players set #lvl ci.tmp 0")
    L.append("execute store result score #lvl ci.tmp run data get %s" % p)
    L.append("execute if score #lvl ci.tmp > #b.%s ci.ench run "
             "scoreboard players operation #b.%s ci.ench = #lvl ci.tmp" % (i, i))
write("scan/book_levels", L)

# ---------------------------------------------------------------- evaluate
L = []
for i, m, t in E:
    L.append('execute if score #b.{0} ci.ench matches 1.. if score #isbook ci.tmp matches 0 '
             'unless items entity @n[type=item,tag=ci_item,distance=..1.2] contents {1} '
             'run scoreboard players set #b.{0} ci.ench 0'.format(i, t))
    L.append("execute if score #b.%s ci.ench matches 1.. run scoreboard players set "
             "#applicable ci.tmp 1" % i)
    L.append("scoreboard players operation #t.%s ci.ench = #c.%s ci.ench" % (i, i))
    L.append("execute if score #b.%s ci.ench > #t.%s ci.ench run scoreboard players "
             "operation #t.%s ci.ench = #b.%s ci.ench" % (i, i, i, i))
    L.append("execute if score #t.%s ci.ench > #c.%s ci.ench run scoreboard players "
             "add #upgrades ci.tmp 1" % (i, i))
    L.append("execute if score #t.%s ci.ench matches %d.. run scoreboard players set "
             "#overcap ci.tmp 1" % (i, m + 1))
    L.append("execute if score #t.%s ci.ench > #c.%s ci.ench run scoreboard players "
             "operation #lvlsum ci.tmp += #t.%s ci.ench" % (i, i, i))
    L.append("execute if score #t.%s ci.ench > #c.%s ci.ench run scoreboard players "
             "operation #lvlsum ci.tmp -= #c.%s ci.ench" % (i, i, i))
for a, b in [p for v in EXCLUSIVE.values() for p in
             [(v[x], v[y]) for x in range(len(v)) for y in range(x + 1, len(v))]]:
    L.append("execute if score #t.%s ci.ench matches 1.. if score #t.%s ci.ench matches 1.. "
             "run scoreboard players set #incompat ci.tmp 1" % (a, b))
L += [
    "scoreboard players operation #cost ci.tmp = #lvlsum ci.tmp",
    "scoreboard players operation #cost ci.tmp *= #xp ci.cfg",
    "scoreboard players operation #cat ci.tmp = #upgrades ci.tmp",
    "scoreboard players operation #cat ci.tmp *= #lapis ci.cfg",
    "execute if score #maxxp ci.cfg matches 1.. if score #cost ci.tmp > #maxxp ci.cfg "
    "run scoreboard players operation #cost ci.tmp = #maxxp ci.cfg",
    "scoreboard players operation #maxp ci.tmp = #shelf ci.tmp",
    "scoreboard players operation #maxp ci.tmp *= #two ci.tmp",
    "execute if score #shelf ci.tmp matches 15.. run scoreboard players set #maxp ci.tmp 999999",
    "scoreboard players operation #need ci.tmp = #cost ci.tmp",
    "scoreboard players add #need ci.tmp 1",
    "scoreboard players operation #need ci.tmp /= #two ci.tmp",
    "execute if score #need ci.tmp matches 16.. run scoreboard players set #need ci.tmp 15",
    "execute if score #books ci.tmp matches 0 run scoreboard players set #fail ci.tmp 1",
    "execute if score #fail ci.tmp matches 0 if score #applicable ci.tmp matches 0 "
    "run scoreboard players set #fail ci.tmp 2",
    "execute if score #fail ci.tmp matches 0 if score #upgrades ci.tmp matches 0 "
    "run scoreboard players set #fail ci.tmp 3",
    "execute if score #fail ci.tmp matches 0 if score #creative ci.tmp matches 0 "
    "if score #cost ci.tmp > #maxp ci.tmp run scoreboard players set #fail ci.tmp 4",
    "execute if score #fail ci.tmp matches 0 if score #cry ci.tmp matches 0 "
    "if score #overcap ci.tmp matches 1 run scoreboard players set #fail ci.tmp 5",
    "execute if score #fail ci.tmp matches 0 if score #cry ci.tmp matches 0 "
    "if score #incompat ci.tmp matches 1 run scoreboard players set #fail ci.tmp 5",
    "execute if score #fail ci.tmp matches 0 if score #creative ci.tmp matches 0 "
    "if score #pl ci.tmp < #cost ci.tmp if score #catc ci.tmp < #cat ci.tmp "
    "run scoreboard players set #fail ci.tmp 6",
    "execute if score #fail ci.tmp matches 0 if score #creative ci.tmp matches 0 "
    "if score #pl ci.tmp < #cost ci.tmp run scoreboard players set #fail ci.tmp 7",
    "execute if score #fail ci.tmp matches 0 if score #creative ci.tmp matches 0 "
    "if score #catc ci.tmp < #cat ci.tmp run scoreboard players set #fail ci.tmp 8",
]
write("scan/evaluate", L)

# ---------------------------------------------------------------- shelves
L = []
for dx in range(-3, 4):
    for dz in range(-3, 4):
        if dx == 0 and dz == 0:
            continue
        for dy in range(0, 4):
            gates = ""
            if abs(dx) > 1:
                gates += " if score #xh ci.cfg matches %d.." % abs(dx)
            if abs(dz) > 1:
                gates += " if score #xh ci.cfg matches %d.." % abs(dz)
            if dy > 0:
                gates += " if score #xv ci.cfg matches %d.." % dy
            los = ""
            if abs(dx) > 1 or abs(dz) > 1:
                los = " if block ~%d ~%d ~%d #minecraft:enchantment_power_transmitter" % (
                    int(dx / 2), dy, int(dz / 2))
            L.append("execute%s if block ~%d ~%d ~%d minecraft:chiseled_bookshelf%s "
                     "positioned ~%d ~%d ~%d run function chiseledinfusion:scan/shelf"
                     % (gates, dx, dy, dz, los, dx, dy, dz))
write("scan/shelves", L)

# ---------------------------------------------------------------- power
L = []
for dx in range(-2, 3):
    for dz in range(-2, 3):
        if abs(dx) != 2 and abs(dz) != 2:
            continue
        for dy in range(-1, 3):
            los = ""
            if not (abs(dx) == 2 and abs(dz) == 2):
                los = " if block ~%d ~%d ~%d #minecraft:enchantment_power_transmitter" % (
                    int(dx / 2), dy, int(dz / 2))
            for blk in ("#minecraft:enchantment_power_provider", "minecraft:chiseled_bookshelf"):
                L.append("execute if block ~%d ~%d ~%d %s%s run scoreboard players "
                         "add #shelf ci.tmp 1" % (dx, dy, dz, blk, los))
L.append("execute if score #shelf ci.tmp matches 16.. run scoreboard players set #shelf ci.tmp 15")
write("scan/power", L)

# ---------------------------------------------------------------- apply/ench
L = ['data modify storage ci:tmp ench set value {}']
for i, _, _ in E:
    L.append('execute if score #t.%s ci.ench matches 1.. store result storage ci:tmp '
             'ench."minecraft:%s" int 1 run scoreboard players get #t.%s ci.ench'
             % (i, i, i))
write("apply/ench", L)

# ---------------------------------------------------------------- msg/enchlist
L = ["scoreboard players set #list ci.tmp 0"]
for i, _, _ in E:
    g = "if score #t.%s ci.ench > #c.%s ci.ench" % (i, i)
    L.append("execute %s if score #list ci.tmp matches 1.. run data modify storage ci:msg "
             'msg.extra append value {text:", "}' % g)
    L.append("execute %s run scoreboard players set #list ci.tmp 1" % g)
    L.append('execute %s run data modify storage ci:msg msg.extra append value '
             '{translate:"enchantment.minecraft.%s"}' % (g, i))
    L.append('execute %s run data modify storage ci:msg msg.extra append value {text:" "}' % g)
    L.append('execute %s run data modify storage ci:msg msg.extra append value '
             '{"score":{name:"#t.%s",objective:"ci.ench"}}' % (g, i))
write("msg/enchlist", L)

# ---------------------------------------------------------------- rays
for path, maxd in (("table/ray", 24), ("preview/ray", 20)):
    L = []
    for k in range(1, maxd + 1):
        d = k * 0.25
        L.append("execute anchored eyes positioned ^ ^ ^%s if block ~ ~ ~ minecraft:enchanting_table "
                 "align xyz positioned ~0.5 ~ ~0.5 run function chiseledinfusion:%s"
                 % (("%g" % d), "table/try" if path == "table/ray" else "preview/show"))
    write(path, L)

# ---------------------------------------------------------------- json
DATA = os.path.join(ROOT, "data")


def write_json(rel, text):
    p = os.path.join(DATA, rel.replace("/", os.sep))
    os.makedirs(os.path.dirname(p), exist_ok=True)
    with open(p, "w", encoding="utf-8", newline="\n") as f:
        f.write(text.strip() + "\n")


write_json("minecraft/tags/function/load.json",
           '{"values": ["chiseledinfusion:load"]}')
write_json("minecraft/tags/function/tick.json",
           '{"values": ["chiseledinfusion:tick"]}')
# The vanilla enchanting table recipe is replaced by one keyed on bedrock: the
# recipe exists (so the vanilla one is gone) but can never be crafted, and the
# ingredient is a normal, non-empty item so the recipe book packet stays valid.
# NOTE: an *empty* item tag as ingredient crashes the client while decoding
# clientbound:recipe_book_add, so never use that trick.
write_json("minecraft/recipe/enchanting_table.json", r'''
{
  "type": "minecraft:crafting_shaped",
  "category": "misc",
  "pattern": ["#"],
  "key": {"#": "minecraft:bedrock"},
  "result": {"id": "minecraft:enchanting_table", "count": 1}
}
''')

# Its unlock advancement is replaced with one that can never be completed, so
# the recipe never shows up in the recipe book.
write_json("minecraft/advancement/recipes/decorations/enchanting_table.json", r'''
{
  "parent": "minecraft:recipes/root",
  "criteria": {"never": {"trigger": "minecraft:impossible"}},
  "requirements": [["never"]]
}
''')

write_json("chiseledinfusion/advancement/place_table.json", r'''
{
  "criteria": {"place": {"trigger": "minecraft:placed_block"}},
  "rewards": {"function": "chiseledinfusion:table/place"}
}
''')

write_json("chiseledinfusion/recipe/chiseled_infuser.json", r'''
{
  "type": "minecraft:crafting_shaped",
  "category": "misc",
  "pattern": [" C ", "DOD", "OOO"],
  "key": {
    "C": "minecraft:red_carpet",
    "D": "minecraft:diamond",
    "O": "minecraft:obsidian"
  },
  "result": {
    "id": "minecraft:enchanting_table",
    "count": 1,
    "components": {
      "minecraft:item_name": {"text": "Chiseled Infusion Table"},
      "minecraft:custom_data": {"ci_table": 1},
      "minecraft:max_stack_size": 1
    }
  }
}
''')

write_json("chiseledinfusion/advancement/recipes/chiseled_infuser.json", r'''
{
  "parent": "minecraft:recipes/root",
  "criteria": {
    "has_carpet": {"trigger": "minecraft:inventory_changed",
                   "conditions": {"items": [{"items": "minecraft:red_carpet"}]}},
    "has_obsidian": {"trigger": "minecraft:inventory_changed",
                     "conditions": {"items": [{"items": "minecraft:obsidian"}]}}
  },
  "requirements": [["has_carpet", "has_obsidian"]],
  "rewards": {"recipes": ["chiseledinfusion:chiseled_infuser"]}
}
''')


if __name__ == "__main__":
    import static
    static.emit(ROOT, FN)
    print("generated")
