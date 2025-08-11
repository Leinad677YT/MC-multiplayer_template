execute store result score #time_to_check l.core.temp_condition run data get storage leinad_temp:schedule queue[-1].time 1

execute if score #time_to_check l.core.temp_condition > #TimeLib TimeLib.UnixTime run return fail
    $function $(function) with storage leinad_temp:schedule queue[-1]
data remove storage leinad_temp:schedule queue[-1]

execute if data storage leinad_temp:schedule queue[0] run function l.schedule:player/check_specific with storage leinad_temp:schedule queue[-1]
