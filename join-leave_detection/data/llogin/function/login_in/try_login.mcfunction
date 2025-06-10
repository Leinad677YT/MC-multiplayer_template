## RELLENO (x25)
tellraw @s {text:"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"}

execute if score @s pin_1_stored = @s pin_1_pass if score @s pin_2_stored = @s pin_2_pass if score @s pin_3_stored = @s pin_3_pass if score @s pin_4_stored = @s pin_4_pass if score @s pin_5_stored = @s pin_5_pass run tag @s add logged_in
scoreboard players reset @s pin_remove
execute if entity @s[tag=!logged_in] run tellraw @s [{text:"[+] ",color:"dark_aqua"},{text:"console.pin.invalid, recarga",bold: true,color:"dark_red"}]
execute if entity @s[tag=!logged_in] run scoreboard players add @s pin_failed 1
execute if entity @s[tag=!logged_in] run tag @s add pin_invalid
## IF NOT LOGGED STOP
execute if entity @s[tag=!logged_in] run return fail
tellraw @s [{text:"[+] ",color:"dark_aqua"},{text:"console.pin.valid",bold: true,color:"dark_green"}]
## status effects remove (llogin)

attribute @s entity_interaction_range base set 3.0
attribute @s jump_strength base reset
attribute @s movement_speed base reset
effect clear @s blindness
playsound minecraft:block.beacon.activate voice @s ~ ~ ~ 1 2 1
tag @s remove in_llogin
scoreboard players set @s can_use_menu 1