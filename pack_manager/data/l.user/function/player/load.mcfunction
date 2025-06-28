execute store result storage leinad_temp:player playerdata.id int 1 run scoreboard players get @s l.player.id
function l.user:login/session/get_from_id with storage leinad_temp:player playerdata
$data modify storage leinad_temp:player playerdata.mode set value "$(mode)"
function l.user:login/session/update_mode_with_id with storage leinad_temp:player playerdata

function #zleinad_pack_manager:call/db/load_mode with storage leinad_temp:player playerdata
