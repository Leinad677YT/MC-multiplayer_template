execute if data storage leinad_perm:schedule queue[0] run function l.schedule:check_queue

execute if data storage leinad_perm:schedule queue_t[0] run function l.schedule:check_queue_t
scoreboard players add #current_tick l.core.temp_condition 1