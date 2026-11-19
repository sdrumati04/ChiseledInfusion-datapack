scoreboard objectives add ci.tmp dummy
scoreboard objectives add ci.ench dummy
scoreboard objectives add ci.cfg dummy
scoreboard objectives add ci.next dummy
scoreboard objectives add ci.time dummy
execute unless score #init ci.cfg matches 2 run function chiseledinfusion:config/defaults
