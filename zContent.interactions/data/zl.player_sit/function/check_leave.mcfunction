## IF SAT => REMOVE MOUNT
    execute store result storage leinad_temp:game sit.id int 1 run scoreboard players get @s l.player.id
    execute if entity @s[scores={zl.player_sit.time=2..}] run function zl.player_sit:get_playerdata with storage leinad_temp:game sit
    execute if entity @s[scores={zl.player_sit.time=2..}] run function zl.player_sit:remove_mount with storage leinad_temp:game sit
##

## RESET TAG AND TRIGGER
    execute if entity @s[scores={zl.player_sit.time=2..}] run tag @s remove zl.player_sit
    execute if entity @s[scores={zl.player_sit.time=2..}] run scoreboard players reset @s zl.player_sit.time
    data remove storage leinad_temp:game sit
    advancement revoke @s only zl.player_sit:leave_sit
##
