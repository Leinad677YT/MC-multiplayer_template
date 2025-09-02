execute if entity @s[type=!marker] run return run function l.core:show_error {error_code:"NOT_EXECUTE_SUMMON"}
$data modify entity @s data merge value {structure:"$(structure)",rotation:"$(rotation)",mirror:"$(mirror)",integrity:"$(integrity)",seed:"$(seed)",strict:"$(strict)"}
tag @s add l.inf_gen.clear
tag @s add l.inf_gen.clear_cplace
$tag @s add l.inf_gen.on_r$(id)