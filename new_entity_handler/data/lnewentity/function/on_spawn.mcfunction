scoreboard players set @s lnewentity.aux_checks 1
$execute if entity @s[tag=lnewentity.v$(version)] run return fail

execute if entity @s[type=#lcore:entity_with_id] unless score @s lcore.entity_id matches -2147483648..2147483647 store result score @s lcore.entity_id run scoreboard players add #newID lcore.entity_id 1

$tag @s add lnewentity.v$(version)
$scoreboard players set #version_check lcore.entity_id $(version)

execute unless entity @s[tag=lcore.has_data] run function #zleinad_pack_manager:call/new_entity/on_entity_spawn
execute store result storage leinad_temp:entity_spawn macro.version int 1 run scoreboard players remove #version_check lcore.entity_id 1
execute unless score #version_check lcore.entity_id matches 0 run function lnewentity:manage_old_data with storage leinad_temp:entity_spawn macro
tag @s add lcore.has_data

data remove storage leinad_temp:entity_spawn macro
