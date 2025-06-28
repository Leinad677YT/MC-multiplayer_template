$data modify storage leinad_temp:player playerdata set from storage leinad_perm:online session[{name:"$(name)"}]
#$data modify storage leinad_perm:player invcache.mode set value "$(mode)"
function #zleinad_pack_manager:call/db/save_mode with storage leinad_temp:player playerdata
