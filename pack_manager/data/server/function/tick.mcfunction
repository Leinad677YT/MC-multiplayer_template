## llogin

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
##

## MUERTES
    execute as @a[scores={lcore.deathCount=1}] run function server:player_management/player_died
##
