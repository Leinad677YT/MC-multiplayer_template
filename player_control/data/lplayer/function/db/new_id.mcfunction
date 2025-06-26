## assign the id
    execute store result score @s lplayer.id run scoreboard players add #newID lplayer.fixed_id 1
    $scoreboard players operation #$(lower) lplayer.fixed_id = @s lplayer.id
##
execute store result storage leinad_temp:login player.id int 1 run scoreboard players get @s lplayer.id