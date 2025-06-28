## EXECUTED AS THE DIRECT ATTACKER

scoreboard players set #is_ranged l.core.temp_condition 0
execute unless score @s l.core.entity_id = #attacker l.core.temp_condition unless score @s l.player.id = #attacker l.core.temp_condition run scoreboard players set #is_ranged l.core.temp_condition 1
