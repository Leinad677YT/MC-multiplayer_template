## CHANGE VERSION TO PREVIOUS AND DELETE
    $execute store success score #temp l.core.temp_condition run tag @s remove l.new_entity.v$(version)
    execute store result storage leinad_temp:entity_spawn macro.version int 1 run scoreboard players remove #version_check l.core.entity_id 1
    execute unless score #version_check l.core.entity_id matches 0 run function l.new_entity:manage_old_data with storage leinad_temp:entity_spawn macro
##

## STUFF THAT NEEDS UPDATING SHOULD GO HERE BASED OFF VERSION
    ## IF NOT ON THIS VERSION, DON'T CONTINUE
        execute if score #temp l.core.temp_condition matches 0 run return fail
        # $say the version executions are also ordered from old to new, [v$(version)] see?
    ##
    ## "Version fix" function
        # this is independant for every world/world update, 
        # remember to check which "notes" you have on the storage
        # `storage leinad_perm:version on_entity_spawn.data.$(version)`
        $function l.user/new_entity/fix_v$(version) with storage storage leinad_perm:version on_entity_spawn.data.$(version)
    ##
##