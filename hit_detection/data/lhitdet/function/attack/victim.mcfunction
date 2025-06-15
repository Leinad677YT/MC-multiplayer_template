scoreboard players set #temp lcore.temp_condition -1
execute on attacker store success score #temp1 lcore.temp_condition if entity @s[type=player] run scoreboard players operation #temp lcore.temp_condition = @s lplayer.id
execute if score #temp1 lcore.temp_condition matches 0 run scoreboard players operation #temp lcore.temp_condition = @s lcore.entity_id

scoreboard players operation @s lhitdet.attacked_by = #temp lcore.temp_condition
scoreboard players operation @s lhitdet.attacked_by_player = #temp1 lcore.temp_condition


function #lhitdet:victim
execute on attacker run function #lhitdet:attacker
## Melee / Ranged
execute if score #is_ranged lcore.temp_condition matches 0 run return run function lhitdet:attack/melee

function lhitdet:attack/ranged