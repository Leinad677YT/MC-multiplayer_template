## load function

tellraw Leinad677YT [{text:"[!] ",color:dark_aqua},{translate:"leinad.team.tellraw.load",fallback:"Loading team_overhaul",color:"gray"}]

## SCOREBOARDS
    
    ## VISUALS
        scoreboard objectives add lteam.pref dummy
        scoreboard objectives add lteam.suf1 dummy
        scoreboard objectives add lteam.suf2 dummy
        scoreboard objectives add lteam.suf3 dummy
    ##

    ## SERVERSIDE
        scoreboard objectives add lteam.current dummy
        scoreboard objectives add lteam.invited dummy
        scoreboard objectives add lteam.invited_to dummy
    ##
##

## FORCELOAD not needed in this datapack group
    execute in overworld run forceload add 0 0
##

## RELOAD MENU DATA
    function lmenu:control/reload_data
##
