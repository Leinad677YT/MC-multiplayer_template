## EXECUTED AS THE ORIGINAL ATTACKER

scoreboard players set #attacker l.core.temp_condition 0
execute store result score #attacker l.core.temp_condition run scoreboard players get @s l.player.id
execute unless score @s l.player.id matches -2147483648..2147483647 store result score #attacker l.core.temp_condition run scoreboard players get @s l.core.entity_id
