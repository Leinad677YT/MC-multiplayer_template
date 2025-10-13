## CALLED FROM l.login:call/restart

## ONLINE CHECK
    # if was online, append again
    $execute if entity @a[name=$(name)] as @a[name=$(name)] unless score @s l.login.left matches 1.. run return run data modify storage leinad_temp:login online_ append from storage leinad_temp:login name
##

## CALL THE OTHER FUNCTIONS
    $data modify storage leinad_perm:online session[{name:"$(name)"}].leaving set value 1b
    function #zleinad_pack_manager:call/login/disconnected with storage leinad_perm:online session[{leaving:1b}]
##

## FINISH
        
    ## SCHEDULED DISCONNECTION FUNCTIONS # MODULE
        data modify storage leinad_perm:schedule function append from storage leinad_perm:online session[{leaving:1b}].schedule_trigger[{trigger:0}]
        execute if data storage leinad_perm:schedule function[0] run function l.user:misc/execute_queue with storage leinad_perm:schedule function[-1]
    ##

    ## SAVE SCORES
        function l.player:score/save_scores with storage leinad_perm:online session[{leaving:1b}]
        scoreboard players reset #temp_score l.core.temp_condition
        $scoreboard players operation #temp_score l.core.temp_condition = $(name) l.player.id
        $scoreboard players reset $(name)
        $scoreboard players operation $(name) l.player.id = #temp_score l.core.temp_condition
    ##
    
    ## PERSONAL TEAM
        $team remove z_p$(name)
    ##

    ## SESSION DATA
        data remove storage leinad_perm:online session[{leaving:1b}]
    ##

    
##
