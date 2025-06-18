## CHANGE VERSION TO PREVIOUS AND DELETE
    $execute store success score #temp lcore.temp_condition run tag @s remove lnewentity.v$(version)
    execute store result storage leinad_temp:entity_spawn macro.version int 1 run scoreboard players remove #version_check lcore.entity_id 1
    execute unless score #version_check lcore.entity_id matches 0 run function lnewentity:manage_old_data with storage leinad_temp:entity_spawn macro
##

## STUFF THAT NEEDS UPDATING SHOULD GO HERE BASED OFF VERSION
    ## IF NOT ON THIS VERSION, DON'T CONTINUE
        execute if score #temp lcore.temp_condition matches 0 run return fail
        # $say the version executions are also ordered from old to new, [v$(version)] see?
    ##
##