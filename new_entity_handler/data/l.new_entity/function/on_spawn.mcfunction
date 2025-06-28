scoreboard players set @s l.new_entity.aux_checks 1
$execute if entity @s[tag=l.new_entity.v$(version)] run return fail

execute if entity @s[type=#l.core:entity_with_id] unless score @s l.core.entity_id matches -2147483648..2147483647 store result score @s l.core.entity_id run scoreboard players add #newID l.core.entity_id 1

$tag @s add l.new_entity.v$(version)
$scoreboard players set #version_check l.core.entity_id $(version)

execute unless entity @s[tag=l.core.has_data] run function #zleinad_pack_manager:call/new_entity/on_entity_spawn
execute store result storage leinad_temp:entity_spawn macro.version int 1 run scoreboard players remove #version_check l.core.entity_id 1
execute unless score #version_check l.core.entity_id matches 0 run function l.new_entity:manage_old_data with storage leinad_temp:entity_spawn macro
tag @s add l.core.has_data

data remove storage leinad_temp:entity_spawn macro
