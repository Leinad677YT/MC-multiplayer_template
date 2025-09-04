execute if entity @s[tag=!l.inventory.save_spawn] run return fail

data modify storage leinad_temp:player spawn set from entity @s respawn
data modify storage leinad_temp:player spawn.macro set value {forced:false,block:"minecraft:white_bed"}
function l.inventory:db_interaction/update/spawn_changed
advancement revoke @s only l.inventory:changed_spawnpoint/white_bed