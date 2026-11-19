data modify storage ci:macro args.cat set from storage ci:cfg catalyst
data modify storage ci:macro args.n set value 0
execute store result storage ci:macro args.n int 1 run scoreboard players get #cat ci.tmp
function chiseledinfusion:player/clear_cat with storage ci:macro args
data modify storage ci:macro args.n set value 0
execute store result storage ci:macro args.n int 1 run scoreboard players get #cost ci.tmp
function chiseledinfusion:player/xp with storage ci:macro args
