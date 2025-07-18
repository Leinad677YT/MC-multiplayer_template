execute store result score #time_to_check l.core.temp_condition run data get storage leinad_perm:schedule queue[-1].time 1

execute if score #time_to_check l.core.temp_condition < #current_tick l.core.temp_condition run tellraw Leinad677YT activated
data remove storage leinad_perm:schedule queue_t[-1]