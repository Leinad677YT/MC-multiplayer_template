execute store result storage leinad_temp:player freezer.session int 1 run data get entity @s data.session

execute in l.core:void run function l.player:freezer/restore_end with entity @s data

kill @s
data remove storage leinad_temp:player freezer