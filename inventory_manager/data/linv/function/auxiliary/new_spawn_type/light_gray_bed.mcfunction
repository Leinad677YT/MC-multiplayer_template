execute if entity @s[tag=linv.not_save_spawn] run return fail

data modify storage leinad_temp:player spawn set from entity @s respawn
data modify storage leinad_temp:player spawn.macro set value {forced:false,block:"minecraft:light_gray_bed"}
function linv:db_interaction/update/spawn_changed
advancement revoke @s only linv:changed_spawnpoint/light_gray_bed