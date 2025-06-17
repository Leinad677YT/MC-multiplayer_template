execute in overworld run loot replace block 0 -63 0 container.0 loot lcore:phead_own
execute in overworld run data modify storage stringlib:temp data.Input set string block 0 -63 0 Items[0].components."minecraft:profile".name
function str:tolow_fast
data modify storage leinad_temp:player invcache.name set from storage stringlib:output to_lowercase

data modify storage leinad_temp:player invcache.mode set value "dungeon"

execute store result storage leinad_temp:player invcache.x int 1 run scoreboard players get @s linv.cache_x
execute store result storage leinad_temp:player invcache.z int 3 run scoreboard players get @s linv.cache_z

function linv:db_interaction/prepare_save with storage leinad_temp:player invcache
