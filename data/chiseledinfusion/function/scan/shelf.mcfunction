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
