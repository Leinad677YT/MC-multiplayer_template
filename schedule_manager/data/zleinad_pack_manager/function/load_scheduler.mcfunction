## If this was loaded from the library, turn on player schedules


## TELLRAW
    tellraw @a[tag=l.core.tellraw] [{text:"[!] ",color:dark_aqua},{translate:"leinad.l.schedule.tellraw.load",fallback:"Loading event_scheduler",color:"gray"}]
##

## SCOREBOARD
    scoreboard players set #schedule.on l.core.temp_condition 1
##

## CLEAR TICK SCHEDULES
    data remove storage leinad_perm:schedule queue_t[]
    data remove storage leinad_perm:online session[].schedule_[]
##
