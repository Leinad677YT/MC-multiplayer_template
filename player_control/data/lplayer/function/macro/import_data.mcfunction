$data modify storage z_p$(lower):root data merge from storage z_i$(lower):$(path) data
$execute store result storage storage z_p$(lower):root data.id int 1 run scoreboard players get @s lplayer.id