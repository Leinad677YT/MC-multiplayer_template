execute store result storage leinad_temp:instance kick.id int 1 run scoreboard players get @s l.instance.current
execute store result storage leinad_temp:instance kick.player int 1 run scoreboard players get @s l.player.id
execute unless score @s l.instance.current matches -2147483648..2147483647 run data modify storage leinad_temp:instance kick.error_code set value "KICKED_PLAYER_OUTSIDE_INSTANCES"
scoreboard players reset @s l.instance.current
execute unless data storage leinad_temp:instance kick.error_code run function l.instance:zaux/leave_instance with storage leinad_temp:instance kick
execute unless data storage leinad_temp:instance kick.error_code run function l.instance:manage_leaving with storage leinad_temp:instance kick

function l.instance:zaux/remove_leave_trigger with storage leinad_temp:instance kick

function l.core:show_error with storage leinad_temp:instance kick
tag @s remove l.instance.already_assigned
data remove storage leinad_temp:instance kick
