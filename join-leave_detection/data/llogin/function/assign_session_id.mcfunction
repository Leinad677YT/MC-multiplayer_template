## IF NOT AN EMPTY SESSION, FAIL
    scoreboard players add #newID llogin.session_id 1
    scoreboard players operation #newID llogin.session_id %= #64 lcore.cte
    execute if entity @a[predicate=llogin:has_session_id,limit=1] run return fail
##

## SET OWN SESSION IF WAS ABLE
    scoreboard players operation @s llogin.session_id = #newID llogin.session_id
##

## EXECUTE ALL SESSION RELATED FUNCTIONS
    function #zleinad_pack_manager:z_llogin/session
##
