## TELLRAW
    tellraw Leinad677YT [{text:"[!] ",color:dark_aqua},{translate:"leinad.lnewentity.tellraw.load",fallback:"Loading new_entity_handler",color:"gray"}]
##

## MODIFYABLE
    ## NEW SPAWN_DATA ON THIS VERSION
        data modify storage leinad_temp:entity_spawn macro.data set value {scoreboards:[{name:"lcore.entity_id",non_deleted_on_module:1b}],tags:[]}
    ##
##

## TO AVOID USELESS CHECKS
    scoreboard objectives remove lnewentity.aux_checks
    scoreboard objectives add lnewentity.aux_checks dummy
##

## WAS IT ALREADY INSTALLED?
    ## Y # Check for changes in data
    execute if score #entities_have_id lcore.entity_id matches 1 run return run function lnewentity:control/manage_reload
##     N # Continue

## PREPARE SCOREBOARDS
    scoreboard objectives add lcore.entity_id dummy
    scoreboard players set #entities_have_id lcore.entity_id 1
##

## GET NEW VERSION
    data modify storage leinad_perm:version on_entity_spawn.data.current set from storage leinad_temp:entity_spawn macro.data
    execute unless data storage leinad_perm:version on_entity_spawn.version run data modify storage leinad_perm:version on_entity_spawn.version set value 0
    execute store result score #temp lcore.temp_condition store result storage leinad_temp:entity_spawn macro.version int 1 run data get storage leinad_perm:version on_entity_spawn.version 1
    execute store result storage leinad_perm:version on_entity_spawn.version int 1 run scoreboard players add #temp lcore.temp_condition 1
    # insert it into the macro data
    data modify storage leinad_temp:entity_spawn macro.version set from storage leinad_perm:version on_entity_spawn.version
##

## SET NEW VERSION DATA -> DB
    function lnewentity:control/update_version with storage leinad_temp:entity_spawn macro
##

## CLEAR TEMP DATA
    data remove storage leinad_temp:entity_spawn macro
##
