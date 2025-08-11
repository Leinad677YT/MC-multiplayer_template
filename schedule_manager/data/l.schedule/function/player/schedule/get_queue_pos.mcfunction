## IF NO ITEMS => APPEND
    execute if score #schedule.amount l.core.temp_condition matches 0 run return run data modify storage leinad_temp:schedule queue append from storage leinad_temp:schedule to_schedule
##

## GET FIRST AND LAST
    execute store result score #schedule.first l.core.temp_condition run data get storage leinad_temp:schedule queue[-1].time
    execute store result score #schedule.last l.core.temp_condition run data get storage leinad_temp:schedule queue[0].time
##

## IF BEFORE => APPEND; IF AFTER => PREPEND
    execute unless score #schedule.first l.core.temp_condition < #time_to_insert l.core.temp_condition run return run data modify storage leinad_temp:schedule queue append from storage leinad_temp:schedule to_schedule
    execute unless score #schedule.last l.core.temp_condition > #time_to_insert l.core.temp_condition run return run data modify storage leinad_temp:schedule queue prepend from storage leinad_temp:schedule to_schedule
##

## DICHOTOMY TO GET POS
    function l.schedule:player/schedule/dichotomy_iter with storage leinad_temp:schedule insert
##

## INSERT FROM DICHOTOMY
    function l.schedule:player/schedule/insert with storage leinad_temp:schedule insert
##