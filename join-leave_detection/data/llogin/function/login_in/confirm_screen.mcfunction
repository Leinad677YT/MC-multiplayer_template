scoreboard players operation @s pin_5_stored = @s pin_5
scoreboard players set @s pin_5 -1
scoreboard players reset @s pin_remove
scoreboard players enable @s pin_remove
playsound ui.button.click voice @s ~ ~ ~ 1 1 1

## RELLENO (x25)
tellraw @s {text:"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"}

advancement revoke @s only llogin:stages/test_pin
advancement revoke @s only llogin:stages/remove_5
#tellraw @s "=>   <=>     <=>     <=>     <=>     <=>     <=>     <=>     <=>   <="
tellraw @s [{text:"[^] ",color:"dark_aqua"},{text:"console.pin.confirm",color:"gray"}]
tellraw @s {text:"    console.pin.warning_1",color:"dark_red"}
tellraw @s {text:"    console.pin.warning_2",color:"dark_red"}
tellraw @s ""
tellraw @s {text:"                     [ # # # # # ]",bold: true,color:"dark_gray"}
tellraw @s ""
tellraw @s ""
tellraw @s [{text:"                "},{text:"[ CONFIRM ]","clickEvent":{action:"run_command","value": "/trigger pin_remove set -1"}},{text:"       "},{text:"[ DELETE ]","clickEvent":{action:"run_command","value":"/trigger pin_remove set 5"}}]
#tellraw @s "=>   <=>     <=>     <=>     <=>     <=>     <=>     <=>     <=>   <="
