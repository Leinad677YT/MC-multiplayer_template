## l.login # CORE
    ## PLAYER JOINS
        execute in l.core:void as @a[predicate=l.core:joins] run function l.login:call/joined
    ##

    ##   = l.player.id -> RESTART
        execute unless score #playercount l.login.online = #lastplayercount l.login.online run function l.login:call/restart
    ##
    
    ##   UPDATE ONLINE LIST
        scoreboard players operation #lastplayercount l.login.online = #playercount l.login.online
        execute store result score #playercount l.login.online if entity @a
    ##

    ## ASSIGN session_id
        execute as @a[scores={l.login.session_id=-1}] run function l.login:auxiliary/assign_session_id
    ##
##

## death management # CORE
        # this NEEDS to happen at least 1 tick before the join detection, that's why join calls require (deathCount = 0)
    execute as @a[predicate=l.core:is_ded] at @s if function l.core:auxiliary/player_exists run function l.core:player_management/player_died
##

## entity management # CORE
    execute as @e[type=!#l.core:_no_ai] run function l.core:entity_management/no_ai
##



## module calls # MODULE
    function #zleinad_pack_manager:call/tick/midway
##

## SCHEDULE

    ## CHECK QUEUES
        function l.schedule:tick
    ##

    ## PRIORITY QUEUE
        execute if data storage leinad_perm:schedule prioritary.execute[0] run return run function l.schedule:tick_priority/execute_queue with storage leinad_perm:schedule prioritary.execute[-1]
    ##

    ## LIMITED QUEUE
        scoreboard players set #current_scheduled_event l.core.temp_condition 0
        execute if data storage leinad_perm:schedule generic.execute[0] run return run function l.schedule:no_context/execute_queue with storage leinad_perm:schedule generic.execute[-1]
    ##
##
