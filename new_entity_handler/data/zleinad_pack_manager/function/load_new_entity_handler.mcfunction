## TELLRAW
    tellraw Leinad677YT [{text:"[!] ",color:dark_aqua},{translate:"leinad.l.new_entity.tellraw.load",fallback:"Loading new_entity_handler",color:"gray"}]
##

## MODIFYABLE
    ## NEW SPAWN_DATA ON THIS VERSION
        data modify storage leinad_temp:entity_spawn macro.data set value {scoreboards:[{name:"l.core.entity_id",non_deleted_on_module:1b}],tags:[]}
        function #zleinad_pack_manager:call/new_entity/entity_data
    ##
##

## TO AVOID USELESS CHECKS ON ENTITIES
    scoreboard objectives remove l.new_entity.aux_checks
    scoreboard objectives add l.new_entity.aux_checks dummy
##

## WAS IT ALREADY INSTALLED?
    ## Y # Check for changes in data
    execute if score #entities_have_id l.core.entity_id matches 1 run return run function l.new_entity:control/manage_reload
##     N # Continue

## PREPARE SCOREBOARDS
    # scoreboard objectives add l.core.entity_id dummy
    scoreboard players set #entities_have_id l.core.entity_id 1
##

## GET NEW VERSION
    data modify storage leinad_perm:version on_entity_spawn.data.current set from storage leinad_temp:entity_spawn macro.data
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
