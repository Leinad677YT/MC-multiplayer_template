## llogin # CORE

    ## PLAYER JOINS
        execute in minecraft:overworld as @a[scores={llogin.online=0, lcore.deathCount=0}] run function llogin:call/joined
    ##

    ##   = lplayer.id -> RESTART
        execute unless score #playercount llogin.online = #lastplayercount llogin.online run function llogin:call/restart
    ##

    ##   UPDATE ONLINE LIST
        scoreboard players operation #lastplayercount llogin.online = #playercount llogin.online
        execute store result score #playercount llogin.online run list
    ##

    ## ASSIGN session_id
        execute as @a[scores={llogin.session_id=-1}] run function llogin:assign_session_id
    ##
##

## death management # CORE
        # this NEEDS to happen at least 1 tick before the join detection, that's why join calls require (deathCount = 0)
    execute as @a[scores={lcore.deathCount=1..}] run function lcore:player_management/player_died
##

## entity management # CORE
    execute as @e[type=#lcore:entity_with_id,tag=!lcore.has_data] run function lcore:entity_management/new
##

## module calls # MODULE
    function #zleinad_pack_manager:tick/midway
##