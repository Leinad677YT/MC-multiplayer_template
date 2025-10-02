## CHECK IF LOOKING DOWN
    tag @s add zl.sit.self
    execute unless entity @s[tag=zl.player_sit] positioned ^ ^ ^1 positioned ~-1 ~-1 ~-1 if entity @a[tag=zl.sit.self,dy=1.01,limit=1] unless entity @a[tag=zl.sit.self,dy=0.99,limit=1] run tag @s add zl.player_sit
##

## CHECK IF MOUNTED
    execute on vehicle unless entity @s[tag=zl.sit.self] run tag @s remove zl.player_sit
##

## IF LOOKING DOWN => SIT
    execute if entity @s[tag=zl.player_sit] run scoreboard players add @s zl.player_sit.time 0
    execute store result storage leinad_temp:game sit.id int 1 run scoreboard players get @s l.player.id
    execute if entity @s[tag=zl.player_sit,tag=zl.sit.self] run function zl.player_sit:get_playerdata with storage leinad_temp:game sit
    execute if entity @s[tag=zl.player_sit,tag=zl.sit.self] summon block_display run function zl.player_sit:sit with storage leinad_temp:game sit
##

## RESET TAG AND TRIGGER
    tag @s remove zl.sit.self
    data remove storage leinad_temp:game sit
    advancement revoke @s only zl.player_sit:sit_trigger
##
