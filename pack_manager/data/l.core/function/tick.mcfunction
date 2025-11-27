## l.login # CORE
    ##   = l.player.id -> RESTART
        execute unless score #playercount l.login.online = #lastplayercount l.login.online run function l.login:call/restart
        execute if entity @a[scores={l.login.left=1..}] run function l.login:call/restart
    ##
    
    ## UPDATE ONLINE LIST
        scoreboard players operation #lastplayercount l.login.online = #playercount l.login.online
        execute store result score #playercount l.login.online if entity @a[predicate=l.core:is_online]
    ##

    ## PLAYER JOINS
        execute in l.core:void as @a[predicate=l.core:joins] run function l.login:call/joined
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

## schedule pre-tick
    schedule function l.core:pre_tick 1t
##