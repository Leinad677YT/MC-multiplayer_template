$execute in $(dimension) run tp @s $(x) $(y) $(z) $(angle) ~
# to avoid overwritting data
$data modify storage leinad_temp:player temp.pos set value {x:$(x),y:$(y),z:$(z)}
execute store result score @s linv.coord.x00 run data get storage leinad_temp:player temp.pos.x 100
execute store result score @s linv.coord.y00 run data get storage leinad_temp:player temp.pos.y 100
execute store result score @s linv.coord.z00 run data get storage leinad_temp:player temp.pos.z 100