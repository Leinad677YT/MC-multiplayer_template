tag @s add l.room.marker
execute store result entity @s width float 0.001 run scoreboard players get #create_width l.room.current
execute store result entity @s height float 0.001 run scoreboard players get #create_height l.room.current
execute store result score @s l.room.current run scoreboard players get #create_id l.room.current