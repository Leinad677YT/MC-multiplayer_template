$tag @e[type=marker,tag=zl.inf_garden.door.connected,scores={l.room.current=$(id)}] remove zl.inf_garden.door.connected
$scoreboard players set @e[type=marker,tag=zl.inf_garden.door,scores={l.room.current=$(id)}] l.room.current 0



$tellraw @a "> REMOVED >> $(id)"