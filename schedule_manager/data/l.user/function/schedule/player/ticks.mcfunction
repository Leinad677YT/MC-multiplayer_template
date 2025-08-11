## DATA
    
    ## TIME
        scoreboard players operation #time_to_insert l.core.temp_condition = #current_tick l.core.temp_condition
        $scoreboard players add #time_to_insert l.core.temp_condition $(ticks)
        execute store result storage leinad_temp:schedule to_schedule.time int 1 run scoreboard players get #time_to_insert l.core.temp_condition
    ##

    $data modify storage leinad_temp:schedule to_schedule merge value $(context)
    $data modify storage leinad_temp:schedule to_schedule.function set value "$(function)"
##

## GET QUEUE
    $execute if entity $(lower) run data modify storage leinad_temp:schedule queue set from storage leinad_perm:online session[{lower:"$(lower)"}].schedule_
##

## GET POSITION ON QUEUE
    
    ## AMOUNT /// TIMESTAMPS
        execute store result score #schedule.amount l.core.temp_condition store result score #schedule.first.pos l.core.temp_condition if data storage leinad_temp:schedule queue[]
        execute store result score #schedule.check.pos l.core.temp_condition run scoreboard players remove #schedule.first.pos l.core.temp_condition 1
        scoreboard players set #schedule.last.pos l.core.temp_condition 0
        execute store result storage leinad_temp:schedule insert.check int 1 run scoreboard players operation #schedule.check.pos l.core.temp_condition /= #2 l.core.cte
    ##

    ## INSERT
        function l.schedule:player/schedule/get_queue_pos
    ##
##

## UPDATE QUEUE
    $execute if entity $(lower) run data modify storage leinad_perm:online session[{lower:"$(lower)"}].schedule_ set from storage leinad_temp:schedule queue
##

## REMOVE TEMP DATA
    data remove storage leinad_temp:schedule to_schedule
    data remove storage leinad_temp:schedule insert
    data remove storage leinad_temp:schedule queue
##
