## OTHER SYSTEMS
    # data is provided by the new_entity_handler module
    execute unless score @s l.new_entity.aux_checks matches -2147483648..2147483647 if score #entities_have_id l.core.entity_id matches -2147483648..2147483647 run function l.new_entity:on_spawn with storage leinad_perm:version on_entity_spawn
##