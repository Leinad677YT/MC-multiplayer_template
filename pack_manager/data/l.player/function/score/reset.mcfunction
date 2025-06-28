scoreboard players reset #temp_score l.core.temp_condition
$scoreboard players operation #temp_score l.core.temp_condition = $(name) l.player.id
$scoreboard players reset $(name)
$scoreboard players operation $(name) l.player.id = #temp_score l.core.temp_condition