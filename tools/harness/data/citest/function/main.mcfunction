scoreboard players add #t citest 1
execute if score #t citest matches 5 run function citest:setup
execute if score #t citest matches 25 run function citest:probe
execute if score #t citest matches 45 run function citest:apply
