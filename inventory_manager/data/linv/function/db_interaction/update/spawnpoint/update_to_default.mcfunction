$data modify storage z_p$(lower):root data.$(mode).inventory.light.spawnpoint set from storage leinad_perm:data initial_playerdata.$(mode).inventory.light.spawnpoint
#data remove storage leinad_temp:player spawn

$function linv:user/set_pos with storage leinad_perm:data initial_playerdata.$(mode).inventory.light.spawnpoint
$function linv:db_interaction/setdata/set_spawn with storage leinad_perm:data initial_playerdata.$(mode).inventory.light.spawnpoint
data remove storage leinad_temp:player spawn