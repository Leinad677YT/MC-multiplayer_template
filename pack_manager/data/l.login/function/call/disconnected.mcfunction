## CALLED FROM l.login:call/restart

## ONLINE CHECK
    # if was online, append again
    $execute if entity @a[name=$(name)] run return run data modify storage leinad_temp:login online_ append from storage leinad_temp:login name
##

## OFFLINE

    ## PERSONAL TEAM
        $team remove z_p$(name)
    ##

    ## SERVERSIDE TEAM
        # $scoreboard players reset $(name) l.team.current
        # $scoreboard players reset $(name) l.team.invited
        # $scoreboard players reset $(name) l.team.invited_to
    ##

## 

## CALL THE OTHER FUNCTIONS
    $function #zleinad_pack_manager:call/login/disconnected with storage leinad_perm:online session[{name:"$(name)"}]
##

## FINISH
        
    ## SCHEDULED DISCONNECTION FUNCTIONS
        $data modify storage leinad_perm:schedule with_context.execute append from storage leinad_perm:online session[{name:"$(name)"}].scheduled[{on_disconnect:1b}]
        execute if data storage leinad_perm:schedule context.execute[0] run return run function l.schedule:from_function/execute_queue with storage leinad_perm:schedule context.execute[-1]
    ##

    ## SAVE SCORES
        $function l.player:score/save_scores with storage leinad_perm:online session[{name:"$(name)"}]
        scoreboard players reset #temp_score l.core.temp_condition
        $scoreboard players operation #temp_score l.core.temp_condition = $(name) l.player.id
        $scoreboard players reset $(name)
        $scoreboard players operation $(name) l.player.id = #temp_score l.core.temp_condition
    ##
    
    ## SESSION DATA
        $data remove storage leinad_perm:online session[{name:"$(name)"}]
    ##
##
