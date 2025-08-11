## IRL QUEUE
    execute if data storage leinad_perm:schedule queue[0] run function l.schedule:check_queue
##

## TICK QUEUE
    execute if data storage leinad_perm:schedule queue_t[0] run function l.schedule:check_queue_t
##

## EXECUTION

    ## PRIORITY QUEUE
        execute if data storage leinad_perm:schedule prioritary.execute[0] run return run function l.schedule:tick_priority/execute_queue with storage leinad_perm:schedule prioritary.execute[-1]
    ##

    ## LIMITED QUEUE
        scoreboard players set #current_scheduled_event l.core.temp_condition 0
        execute if data storage leinad_perm:schedule generic.execute[0] run return run function l.schedule:no_context/execute_queue with storage leinad_perm:schedule generic.execute[-1]
    ##
##

## PLAYER QUEUES
    execute if score #schedule.on l.core.temp_condition matches 1 run function l.schedule:player/check_all
##

## ITERATE
    scoreboard players add #current_tick l.core.temp_condition 1
##
