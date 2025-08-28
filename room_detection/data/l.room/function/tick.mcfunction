## DETECT
    execute as @a at @s positioned ~ ~-10000 ~ run function l.room:detection
##

execute as @a[tag=l.room.inside] at @s run particle dust{color:123132,scale:1} ~ ~2 ~ 0 0 0 0 2 force
