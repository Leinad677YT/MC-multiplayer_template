## CALLED FROM llogin:call/restart

## ONLINE CHECK
    # if was online, append again
    $execute if entity @a[name=$(name)] run return run data modify storage leinad_temp:login online_ append from storage leinad_temp:login name
##

## OFFLINE

    ## PERSONAL TEAM
        $team remove z_p$(name)
    ##

    ## SERVERSIDE TEAM
        $scoreboard players reset $(name) lteam.current
        $scoreboard players reset $(name) lteam.invited
        $scoreboard players reset $(name) lteam.invited_to
    ##

## 

## CALL THE OTHER FUNCTIONS
    $function #zleinad_pack_manager:call/login/disconnected with storage leinad_perm:online session[{name:"$(name)"}]
##

## FINISH
    ## SESSION DATA
        $data remove storage leinad_perm:online session[{name:"$(name)"}]
    ##
##
