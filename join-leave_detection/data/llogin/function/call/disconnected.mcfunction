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

## STORE FOR IMPORT
    data modify storage stringlib:temp data.Input set from storage leinad_temp:login name
    function str:tolow_fast
    data modify storage leinad_temp:login import.name set from storage stringlib:output to_lowercase
    function lplayer:macro/save_import with storage leinad_temp:login import
##
