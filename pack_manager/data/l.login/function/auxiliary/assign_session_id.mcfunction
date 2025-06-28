## IF NOT AN EMPTY SESSION, FAIL
    scoreboard players add #newID l.login.session_id 1
    scoreboard players operation #newID l.login.session_id %= #max_players l.login.session_id
    execute if entity @a[predicate=l.login:has_session_id,limit=1] run return fail
##

## SET OWN SESSION IF WAS ABLE
    execute store result storage leinad_temp:player playerdata.id int 1 run scoreboard players get @s l.player.id
    scoreboard players operation @s l.login.session_id = #newID l.login.session_id
    function l.login:auxiliary/update_session with storage leinad_temp:player playerdata
##

## EXECUTE ALL SESSION RELATED FUNCTIONS
    function #zleinad_pack_manager:call/login/session
##
