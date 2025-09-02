## como toda puerta de la sala nueva
data modify storage leinad_temp:game inf_garden.generation.id_2 set value 0
execute store result score @s l.room.current store result storage leinad_temp:game inf_garden.generation.id_2 int 1 run data get entity @e[type=marker,tag=zl.inf_garden.door,distance=0.1..1,limit=1] data.room_id
execute store result score @e[type=marker,tag=zl.inf_garden.door,distance=0.1..1,limit=1] l.room.current run data get storage leinad_temp:game inf_garden.generation.new_room_id
execute if data storage leinad_temp:game inf_garden.generation{id_2:0} run return fail

data modify storage leinad_temp:game inf_garden.generation.id_1 set from storage leinad_temp:game inf_garden.generation.new_room_id
function l.user:inf_gen/link_room_twosided with storage leinad_temp:game inf_garden.generation
tag @s add zl.inf_garden.door.connected
tag @e[type=marker,tag=zl.inf_garden.door,distance=0.1..1,limit=1] add zl.inf_garden.door.connected