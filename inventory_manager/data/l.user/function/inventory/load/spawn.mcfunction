$data modify storage leinad_temp:player inventory set from storage z_p$(lower):root data.mode.$(mode).inventory.light

function l.inventory:db_interaction/setdata/set_spawn with storage leinad_temp:player inventory.spawnpoint

data remove storage leinad_temp:player inventory
