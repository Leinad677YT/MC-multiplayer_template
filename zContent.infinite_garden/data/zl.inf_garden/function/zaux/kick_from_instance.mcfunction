## NOT FOR THIS MODULE => RETURN
    execute unless score #temp l.room.current matches ..-1073741824 unless score @s l.room.current matches ..-1073741824 run return fail
##

## FROM ROOM TO NOTHING
    execute if score #temp l.room.current matches ..-1073741824 unless score @s l.room.current matches -2147483648..2147483647 if entity @s[tag=zl.inf_garden.in_game,scores={l.instance.current=-2147483648..2147483647}] run function l.user:instance/kick_self
    execute if score #temp l.room.current matches ..-1073741824 unless score @s l.room.current matches -2147483648..2147483647 if entity @s[tag=zl.inf_garden.in_game] run tag @s remove zl.inf_garden.in_game
##
