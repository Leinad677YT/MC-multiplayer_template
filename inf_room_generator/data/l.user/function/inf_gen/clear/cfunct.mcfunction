execute if entity @s[type=!marker] run return run function l.core:show_error {error_code:"NOT_EXECUTE_SUMMON"}
$data modify entity @s data merge value {function:"$(function)"}
tag @s add l.inf_gen.clear
tag @s add l.inf_gen.clear_cfunct
$tag @s add l.inf_gen.on_r$(id)