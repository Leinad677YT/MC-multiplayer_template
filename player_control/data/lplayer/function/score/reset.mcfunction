scoreboard players reset #temp_score lcore.temp_condition
$scoreboard players operation #temp_score lcore.temp_condition = $(name) lplayer.id
$scoreboard players reset $(name)
$scoreboard players operation $(name) lplayer.id = #temp_score lcore.temp_condition