## GET CURRENT CHECK
    $execute store result score #schedule.check l.core.temp_condition run data get storage leinad_temp:schedule queue[$(check)].time
##

## #bool = isFirstHalf(); #bool_ = isMid()
    execute store success score #bool l.core.temp_condition if score #schedule.check l.core.temp_condition < #time_to_insert l.core.temp_condition
    execute store success score #bool_ l.core.temp_condition if score #schedule.check l.core.temp_condition = #time_to_insert l.core.temp_condition
##

## IF (#bool_) RETURN
    execute if score #bool_ l.core.temp_condition matches 1 run return fail
##

## CHANGE BOUNDARIES
    execute if score #bool l.core.temp_condition matches 1 run scoreboard players operation #schedule.first.pos l.core.temp_condition = #schedule.check.pos l.core.temp_condition
    execute if score #bool l.core.temp_condition matches 0 run scoreboard players operation #schedule.last.pos l.core.temp_condition = #schedule.check.pos l.core.temp_condition
##

## GET NEW CHECK POSITIONS
    execute if score #bool l.core.temp_condition matches 1 run scoreboard players operation #schedule.check.pos l.core.temp_condition += #schedule.last.pos l.core.temp_condition
    execute if score #bool l.core.temp_condition matches 0 run scoreboard players operation #schedule.check.pos l.core.temp_condition += #schedule.first.pos l.core.temp_condition
    execute store result storage leinad_temp:schedule insert.check int 1 run scoreboard players operation #schedule.check.pos l.core.temp_condition /= #2 l.core.cte
##

## IF (REDUCED_LIST[] == 0) RETURN
    scoreboard players operation #schedule.amount l.core.temp_condition = #schedule.first.pos l.core.temp_condition
    scoreboard players operation #schedule.amount l.core.temp_condition -= #schedule.last.pos l.core.temp_condition
    execute if score #schedule.amount l.core.temp_condition matches 1 run return run execute store result storage leinad_temp:schedule insert.check int 1 run scoreboard players add #schedule.check.pos l.core.temp_condition 1
##
## ELSE {REITERATE}
    function l.schedule:player/schedule/dichotomy_iter with storage leinad_temp:schedule insert
##