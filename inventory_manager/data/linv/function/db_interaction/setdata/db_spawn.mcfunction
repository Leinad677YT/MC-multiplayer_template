data remove storage leinad_temp:player spawn.macro.name
data remove storage leinad_temp:player spawn.macro.mode

$execute in $(dimension) positioned $(x) $(y) $(z) unless entity @s[distance=..10] run return fail

#$execute in $(dimension) run spawnpoint @s $(x) $(y) $(z) 

$data modify storage z_p$(name):root data.$(mode).spawnpoint set from storage leinad_temp:player spawn.macro
