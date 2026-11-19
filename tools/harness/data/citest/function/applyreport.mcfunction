$say CITEST APPLY aw=$(aw)
execute if score #aw citest matches 1 run say CITEST APPLY PASS
execute unless score #aw citest matches 1 run say CITEST APPLY FAIL
