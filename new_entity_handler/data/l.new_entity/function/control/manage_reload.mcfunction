## COMPARE WITH OLD VERSION 
    # data set outside in temp storage
    execute store result score #temp l.core.temp_condition run data modify storage leinad_perm:version on_entity_spawn.data.current set from storage leinad_temp:entity_spawn macro.data
    ## IF IT WAS THE SAME, NO NEED TO UPDATE
    execute if score #temp l.core.temp_condition matches 0 run return run data remove storage leinad_temp:entity_spawn macro
##

## GET NEW VERSION
    execute unless data storage leinad_perm:version on_entity_spawn.version run data modify storage leinad_perm:version on_entity_spawn.version set value 0
    execute store result score #temp l.core.temp_condition store result storage leinad_temp:entity_spawn macro.version int 1 run data get storage leinad_perm:version on_entity_spawn.version 1
    execute store result storage leinad_perm:version on_entity_spawn.version int 1 run scoreboard players add #temp l.core.temp_condition 1
    # insert it into the macro data
    data modify storage leinad_temp:entity_spawn macro.version set from storage leinad_perm:version on_entity_spawn.version
##

## SET NEW VERSION DATA -> DB
    function l.new_entity:control/update_version with storage leinad_temp:entity_spawn macro
##

## CLEAR TEMP DATA
    data remove storage leinad_temp:entity_spawn macro
##
