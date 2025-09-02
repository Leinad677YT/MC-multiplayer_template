$function l.user:instance/clear/bvol {x:15f,y:31f,z:15f,block:"tuff",mode:"strict",id:$(instance_id)}
$function l.user:inf_gen/clear/bvol {x:15f,y:31f,z:15f,block:"tuff",mode:"strict",id:$(new_room_id)}

execute store result score #pos zl.inf_garden.global run data get entity @s Pos[0] 100
scoreboard players operation #pos zl.inf_garden.global /= #1600 zl.inf_garden.global
scoreboard players operation #pos zl.inf_garden.global *= #1600 zl.inf_garden.global
execute store result entity @s Pos[0] double 0.01 run scoreboard players add #pos zl.inf_garden.global 1

execute store result score #pos zl.inf_garden.global run data get entity @s Pos[2] 100
scoreboard players operation #pos zl.inf_garden.global /= #1600 zl.inf_garden.global
scoreboard players operation #pos zl.inf_garden.global *= #1600 zl.inf_garden.global
execute store result entity @s Pos[2] double 0.01 run scoreboard players add #pos zl.inf_garden.global 1

