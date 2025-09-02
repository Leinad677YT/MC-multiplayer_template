## NOT FOR THIS MODULE => RETURN
    execute unless score #temp l.room.current matches ..-1073741824 unless score @s l.room.current matches ..-1073741824 run return fail
##

## CAME FROM A ROOM
    execute if score #temp l.room.current matches ..-1073741824 store result storage leinad_temp:room inf_gen.old int 1 run scoreboard players get #temp l.room.current
    execute if score #temp l.room.current matches ..-1073741824 run function l.inf_gen:zaux/came_from with storage leinad_temp:room inf_gen
##

## WENT TO A ROOM
    execute if score @s l.room.current matches ..-1073741824 store result storage leinad_temp:room inf_gen.new int 1 run scoreboard players get @s l.room.current
    execute if score @s l.room.current matches ..-1073741824 run function l.inf_gen:zaux/went_to with storage leinad_temp:room inf_gen
##

## REMOVE TEMP DATA
    data remove storage leinad_temp:room inf_gen
##