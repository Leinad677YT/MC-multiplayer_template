## GUARDAR EN SCOREBOARDS
scoreboard players operation @s pin_1_pass = @s pin_1_stored
scoreboard players operation @s pin_2_pass = @s pin_2_stored
scoreboard players operation @s pin_3_pass = @s pin_3_stored
scoreboard players operation @s pin_4_pass = @s pin_4_stored
scoreboard players operation @s pin_5_pass = @s pin_5_stored
## AVISAR
tellraw @s {text:"Sal y vuelve a entrar para poder continuar",bold: true,color:"dark_red"}
## TAG
tag @s add has_pin
scoreboard players reset @s pin_remove