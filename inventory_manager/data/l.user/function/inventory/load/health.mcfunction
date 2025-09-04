$data modify storage leinad_temp:player inventory set from storage z_p$(lower):root data.mode.$(mode).inventory.light

## HEALTH
function l.inventory:db_interaction/setdata/set_health with storage leinad_temp:player inventory

data remove storage leinad_temp:player inventory