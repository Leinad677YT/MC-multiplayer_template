## IF NOT AN EMPTY SESSION, FAIL
    scoreboard players add #newID l.login.session_id 1
    scoreboard players add #temp l.login.session_id 1
    scoreboard players operation #newID l.login.session_id %= #max_players l.login.session_id
    execute if score #temp l.core.temp_condition <= #max_players l.login.session_id if entity @a[predicate=l.login:has_session_id,limit=1] run return run function l.login:auxiliary/assign_session_id
##

## SET OWN SESSION IF WAS ABLE
    execute store result storage leinad_temp:player playerdata.id int 1 run scoreboard players get @s l.player.id
    scoreboard players operation @s l.login.session_id = #newID l.login.session_id
    function l.login:auxiliary/update_session with storage leinad_temp:player playerdata
##

## EXECUTE ALL SESSION RELATED FUNCTIONS
    execute if score #temp l.core.temp_condition matches 65 run function l.core:show_error {error_code:"TOO_MANY_PLAYERS"}
    function #zleinad_pack_manager:call/login/session
##
