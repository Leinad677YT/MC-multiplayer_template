## EXECUTED AS THE DIRECT ATTACKER

scoreboard players set #is_ranged lcore.temp_condition 0
execute unless score @s lcore.entity_id = #attacker lcore.temp_condition unless score @s lplayer.id = #attacker lcore.temp_condition run scoreboard players set #is_ranged lcore.temp_condition 1
