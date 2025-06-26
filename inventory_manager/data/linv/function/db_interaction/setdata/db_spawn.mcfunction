data remove storage leinad_temp:player spawn.macro.lower
data remove storage leinad_temp:player spawn.macro.mode
data remove storage leinad_temp:player spawn.macro.name
data remove storage leinad_temp:player spawn.macro.id

# if not near spawnpoint, dont change
$execute in $(dimension) positioned $(x) $(y) $(z) if entity @a[name=$(name),distance=..10] run return fail

#$execute in $(dimension) run spawnpoint @s $(x) $(y) $(z) 

$data modify storage z_p$(lower):root data.mode.$(mode).inventory.light.spawnpoint merge from storage leinad_temp:player spawn.macro
