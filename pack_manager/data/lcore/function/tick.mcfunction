## llogin # CORE
    ## PLAYER JOINS
        execute in lcore:zvoid as @a[predicate=lcore:joins] run function llogin:call/joined
    ##

    ##   = lplayer.id -> RESTART
        execute unless score #playercount llogin.online = #lastplayercount llogin.online run function llogin:call/restart
    ##
    
    ##   UPDATE ONLINE LIST
        scoreboard players operation #lastplayercount llogin.online = #playercount llogin.online
        execute store result score #playercount llogin.online if entity @a
    ##

    ## ASSIGN session_id
        execute as @a[scores={llogin.session_id=-1}] run function llogin:auxiliary/assign_session_id
    ##
##

## death management # CORE
        # this NEEDS to happen at least 1 tick before the join detection, that's why join calls require (deathCount = 0)
    execute as @a[predicate=lcore:is_ded] at @s if function lcore:auxiliary/player_exists run function lcore:player_management/player_died
##

## entity management # CORE
    execute as @e[type=!#lcore:_no_ai] run function lcore:entity_management/no_ai
##

## module calls # MODULE
    function #zleinad_pack_manager:call/tick/midway
##
