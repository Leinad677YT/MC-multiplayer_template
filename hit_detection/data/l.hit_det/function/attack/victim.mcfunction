scoreboard players set #temp l.core.temp_condition -1
execute on attacker store success score #temp1 l.core.temp_condition if entity @s[type=player]
execute if score #temp1 l.core.temp_condition matches 1 on attacker run scoreboard players operation #temp l.core.temp_condition = @s l.player.id
execute if score #temp1 l.core.temp_condition matches 0 on attacker run scoreboard players operation #temp l.core.temp_condition = @s l.core.entity_id

scoreboard players operation @s l.hit_det.attacked_by = #temp l.core.temp_condition
scoreboard players operation @s l.hit_det.attacked_by_player = #temp1 l.core.temp_condition


function #zleinad_pack_manager:call/hit_det/victim
execute on attacker run function #zleinad_pack_manager:call/hit_det/attacker
## Melee / Ranged
execute if score #is_ranged l.core.temp_condition matches 0 run return run function l.hit_det:attack/melee

function l.hit_det:attack/ranged