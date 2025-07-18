scoreboard players operation #time_to_insert l.core.temp_condition = #current_tick l.core.temp_condition
$scoreboard players add #time_to_insert l.core.temp_condition $(ticks)
$data modify storage leinad_temp:schedule to_schedule merge value $(context)
$data modify storage leinad_temp:schedule to_schedule.function set value "$(function)"
execute store result storage leinad_temp:schedule to_schedule.time int 1 run scoreboard players get #time_to_insert l.core.temp_condition
data modify storage leinad_perm:schedule queue_t prepend from storage leinad_temp:schedule to_schedule
data remove storage leinad_temp:schedule to_schedule