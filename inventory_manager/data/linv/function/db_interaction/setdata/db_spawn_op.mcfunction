data remove storage leinad_temp:player spawn.macro.lower
data remove storage leinad_temp:player spawn.macro.mode
data remove storage leinad_temp:player spawn.macro.name
# ignores if the player is far away
$data modify storage z_p$(lower):root data.mode.$(mode).light.spawnpoint set from storage leinad_temp:player spawn.macro
