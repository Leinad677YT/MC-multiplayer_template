## SaveCoords
execute at @s if predicate datacalc:dimension/overworld in overworld run function datacalc:player/store_coords_overworld with block 0 -63 0 Items[0].components.minecraft:profile
execute at @s if predicate datacalc:dimension/the_nether in overworld run function datacalc:player/store_coords_the_nether with block 0 -63 0 Items[0].components.minecraft:profile
execute at @s if predicate datacalc:dimension/the_end in overworld run function datacalc:player/store_coords_the_end with block 0 -63 0 Items[0].components.minecraft:profile

## Desplazar al spawn
execute at @s if predicate datacalc:dimension/any_survival run tellraw @s [{text:"[^] ",color:"dark_aqua"},{text:"console.saved.coords",color:"gray"}]
## mover al "lobby"
execute in leingen:hub run tp @s 8 88 8 -145 0

## "aclimatar"
effect clear @s
attribute @s minecraft:block_interaction_range base set -1
effect give @s saturation infinite 0 true
effect give @s instant_health infinite 0 true

## DESACTIVAR PARA PONER PIN
#function llogin:llogin_in/try_llogin

#execute in leingen:hub run spawnpoint @s 8 88 8 -145
execute if score @s llogin.online matches 1 run return fail
attribute @s minecraft:entity_interaction_range base set -1
effect give @s blindness infinite 0 true
attribute @s movement_speed base set 0
attribute @s jump_strength base set 0
attribute @s gravity base reset