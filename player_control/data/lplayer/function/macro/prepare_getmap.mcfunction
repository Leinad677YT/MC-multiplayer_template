execute in lcore:zvoid run loot replace block 15 0 15 container.0 loot lcore:phead_own
execute in lcore:zvoid run data modify storage leinad_temp:player import.uuid set from block 15 0 15 Items[0].components."minecraft:profile".id
execute store result storage leinad_temp:player import.list int 0.0000001 run data get storage leinad_temp:player import.uuid[0]
