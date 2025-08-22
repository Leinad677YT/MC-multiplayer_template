execute if entity @s[tag=l.instance.already_waiting] run return run function l.core:show_error {error_code:"ALREADY_WAITING_INSTANCE"}
execute if entity @s[tag=l.instance.already_assigned] run return run function l.core:show_error {error_code:"ALREADY_PLAYING_INSTANCE"}
$execute if score #l.instance.$(id).status l.instance.current matches ..0 run return run function l.core:show_error {error_code:"SENT_TO_EMPTY_INSTANCE"}

## JOIN THEM
    $execute store result storage leinad_temp:instance join_specific.team int 1 run scoreboard players get @a[scores={l.instance.current=$(id)},limit=1] l.team.current
    function l.user:team/serverside/join_specific with storage leinad_temp:instance join_specific
    data remove storage leinad_temp:instance join_specific
##