execute store result score #time_to_check l.core.temp_condition run data get storage leinad_perm:schedule queue[-1].time 1

execute if score #time_to_check l.core.temp_condition > #TimeLib TimeLib.UnixTime run return fail
data modify storage leinad_perm:schedule prioritary.execute append from storage leinad_perm:schedule queue[-1]
data remove storage leinad_perm:schedule queue[-1]

execute if data storage leinad_perm:schedule queue[0] run function l.schedule:check_queue
