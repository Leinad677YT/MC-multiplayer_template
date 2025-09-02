## NOT INSIDE A ROOM OF THE GENERATOR => RETURN
    $execute store result score #temp l.room.current run scoreboard players get $(name) l.room.current
    execute unless score #temp l.room.current matches ..-1073741824 run return fail
##

## PROCEEED DEPENDING ON THE DISCONNECTION SETTING OF THE GENERATOR
    execute store result storage leinad_temp:room disconnection.old int 1 run scoreboard players get #temp l.room.current
    $data modify storage leinad_temp:room disconnection.name set value "$(name)"
    function l.inf_gen:zaux/disconnection with storage leinad_temp:room disconnection
    data remove storage leinad_temp:room disconnection
    data remove storage leinad_temp:room temp_group
##