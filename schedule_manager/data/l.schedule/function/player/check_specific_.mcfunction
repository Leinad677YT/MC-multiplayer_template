execute store result score #time_to_check l.core.temp_condition run data get storage leinad_temp:schedule queue_t[-1].time 1

execute if score #time_to_check l.core.temp_condition > #current_tick l.core.temp_condition run return fail
    $function $(function) with storage leinad_temp:schedule queue_t[-1]

execute if data storage leinad_temp:schedule queue_t[0] run function l.schedule:player/check_specific_
