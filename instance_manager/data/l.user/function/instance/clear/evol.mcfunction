execute if entity @s[type=!marker] run return run function l.core:show_error {error_code:"NOT_EXECUTE_SUMMON"}
$data modify entity @s data merge value {dx:$(dx)f,dy:$(dy)f,dz:$(dz)f}
tag @s add l.instance.clear
tag @s add l.instance.clear_evol
$tag @s add l.instance.clear.on_i$(id)