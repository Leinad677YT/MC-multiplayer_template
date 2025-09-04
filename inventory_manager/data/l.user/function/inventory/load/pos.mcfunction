$data modify storage leinad_temp:player inventory set from storage z_p$(lower):root data.mode.$(mode).inventory.light

## POSITINAL STUFF
function l.user:inventory/overwrite/set_pos with storage leinad_temp:player inventory.pos

data remove storage leinad_temp:player inventory
