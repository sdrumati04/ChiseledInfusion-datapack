$say CITEST SCAN books=$(books) app=$(app) bsh=$(bsh) csh=$(csh) shelf=$(shelf) fail=$(fail)
execute if score #books ci.tmp matches 1 if score #applicable ci.tmp matches 1 if score #b.sharpness ci.ench matches 1 run say CITEST SCAN PASS
execute unless score #books ci.tmp matches 1 run say CITEST SCAN FAIL books
execute unless score #applicable ci.tmp matches 1 run say CITEST SCAN FAIL applicable
execute unless score #b.sharpness ci.ench matches 1 run say CITEST SCAN FAIL b.sharpness
