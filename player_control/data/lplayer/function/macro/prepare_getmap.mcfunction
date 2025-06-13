execute in overworld run loot replace block 0 -63 0 container.0 loot server:phead_own
execute in overworld run data modify storage leinad_temp:player import.uuid set from block 0 -63 0 Items[0].components."minecraft:profile".id
execute store result storage leinad_temp:player import.list int 0.0000001 run data get storage leinad_temp:player import.uuid[0]
