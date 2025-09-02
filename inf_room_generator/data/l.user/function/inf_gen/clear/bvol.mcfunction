execute if entity @s[type=!marker] run return run function l.core:show_error {error_code:"NOT_EXECUTE_SUMMON"}
$data modify entity @s data merge value {x:$(x)f,y:$(y)f,z:$(z)f,block:"$(block)",mode:"$(mode)"}
tag @s add l.inf_gen.clear
tag @s add l.inf_gen.clear_bvol
$tag @s add l.inf_gen.on_r$(id)