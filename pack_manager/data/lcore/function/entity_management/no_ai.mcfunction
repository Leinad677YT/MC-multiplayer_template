## OTHER SYSTEMS
    # data is provided by the new_entity_handler module
    execute unless score @s lnewentity.aux_checks matches -2147483648..2147483647 if score #entities_have_id lcore.entity_id matches 1 run function lnewentity:on_spawn with storage leinad_perm:version on_entity_spawn
##