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
