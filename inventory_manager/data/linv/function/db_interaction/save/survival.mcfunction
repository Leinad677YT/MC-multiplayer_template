$data modify storage stringlib:temp data.Input set value "$(name)"
function str:tolow_fast
data modify storage leinad_temp:player invcache.name set from storage stringlib:output to_lowercase

data modify storage leinad_temp:player invcache.mode set value "survival"

$execute store result storage leinad_temp:player invcache.x int 1 run scoreboard players get $(name) linv.cache_x
$execute store result storage leinad_temp:player invcache.z int 3 run scoreboard players get $(name) linv.cache_z

function linv:db_interaction/prepare_save with storage leinad_temp:player invcache
