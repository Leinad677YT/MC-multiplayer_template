scoreboard players enable @s pin_1 
scoreboard players enable @s pin_remove

advancement revoke @s only llogin:stages/writ_1
#tellraw @s "=>   <=>     <=>     <=>     <=>     <=>     <=>     <=>     <=>   <="
tellraw @s [{text:"[^] ",color:"dark_aqua"},{text:"console.pin.announce",color:"gray"}]
tellraw @s ""
tellraw @s {text:"                     [ · · · · · ]",bold: true,color:"dark_gray"}
tellraw @s "                                                                     "
tellraw @s [{text:"                  "},{text:"[ 7 ]","clickEvent":{action:"run_command","value":"/trigger pin_1 set 8"}},{text:"       "},{text:"[ 8 ]","clickEvent":{action:"run_command","value":"/trigger pin_1 set 9"}},{text:"       "},{text:"[ 9 ]","clickEvent":{action:"run_command","value":"/trigger pin_1 set 10"}}]
tellraw @s [{text:"                  "},{text:"[ 4 ]","clickEvent":{action:"run_command","value":"/trigger pin_1 set 5"}},{text:"       "},{text:"[ 5 ]","clickEvent":{action:"run_command","value":"/trigger pin_1 set 6"}},{text:"       "},{text:"[ 6 ]","clickEvent":{action:"run_command","value":"/trigger pin_1 set 7"}}]
tellraw @s [{text:"                  "},{text:"[ 1 ]","clickEvent":{action:"run_command","value":"/trigger pin_1 set 2"}},{text:"       "},{text:"[ 2 ]","clickEvent":{action:"run_command","value":"/trigger pin_1 set 3"}},{text:"       "},{text:"[ 3 ]","clickEvent":{action:"run_command","value":"/trigger pin_1 set 4"}}]
tellraw @s [{text:"                      "},{text:"[ 0 ]","clickEvent":{action:"run_command","value": "/trigger pin_1 set 1"}},{text:"       "},{text:"[ DELETE ]","clickEvent":{action:"run_command","value":"/trigger pin_remove set 1"}}]
#tellraw @s "=>   <=>     <=>     <=>     <=>     <=>     <=>     <=>     <=>   <="
tag @s add in_llogin