## assign the id
    execute store result score @s l.player.id run scoreboard players add #newID l.player.fixed_id 1
    $scoreboard players operation #$(lower) l.player.fixed_id = @s l.player.id
##
execute store result storage leinad_temp:login player.id int 1 run scoreboard players get @s l.player.id