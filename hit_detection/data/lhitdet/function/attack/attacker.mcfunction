## EXECUTED AS THE ORIGINAL ATTACKER

scoreboard players set #attacker lcore.temp_condition 0
execute store result score #attacker lcore.temp_condition run scoreboard players get @s lplayer.id
execute unless score @s lplayer.id matches -2147483648..2147483647 store result score #attacker lcore.temp_condition run scoreboard players get @s lcore.entity_id
