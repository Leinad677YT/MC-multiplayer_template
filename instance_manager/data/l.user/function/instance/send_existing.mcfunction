execute if entity @s[tag=l.instance.already_waiting] run return run function l.core:show_error {error_code:"ALREADY_WAITING_INSTANCE"}
execute if entity @s[tag=l.instance.already_assigned] run return run function l.core:show_error {error_code:"ALREADY_PLAYING_INSTANCE"}
$execute if score #l.instance.$(id).status l.instance.current matches ..0 run return run function l.core:show_error {error_code:"SENT_TO_EMPTY_INSTANCE"}

$scoreboard players set @s l.instance.current $(id)