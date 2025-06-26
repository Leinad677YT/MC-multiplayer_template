## IF NOT AN EMPTY SESSION, FAIL
    scoreboard players add #newID llogin.session_id 1
    scoreboard players operation #newID llogin.session_id %= #max_players llogin.session_id
    execute if entity @a[predicate=llogin:has_session_id,limit=1] run return fail
##

## SET OWN SESSION IF WAS ABLE
    execute store result storage leinad_temp:player playerdata.id int 1 run scoreboard players get @s lplayer.id
    scoreboard players operation @s llogin.session_id = #newID llogin.session_id
    function llogin:auxiliary/update_session with storage leinad_temp:player playerdata
##

## EXECUTE ALL SESSION RELATED FUNCTIONS
    function #zleinad_pack_manager:call/login/session
##
