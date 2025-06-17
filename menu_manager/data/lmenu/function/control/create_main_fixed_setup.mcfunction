### WARNINGS
 ## CHUNK LOADING
  #  THIS MENU TYPE SHOULD BE ENTITY-LOADED AT ALL TIMES THAT YOU MAY NEED TO USE IT
  #
 ## PLAYER LOADING
  #  ENSURE THAT THE MENU IS LOADED FOR THE PLAYER BEFORE SENDING THEM INSIDE, OTHERWISE
  #   THEY WILL NOT BE SPECTATING THE ROOT DISPLAY
 ## ENTITY COUNT
  #  YOU SHOULD ALSO REMEMBER THAT THE AMOUNT OF ENTITIES IS 
  #   [entities/player * players] THIS MEANS THAT IN ORDER TO MAKE IT 
  #   FASTER TO USE (no summon / kill), IT WILL ADD A LOT OF DISPLAYS
  #   LAYING AROUND YOUR WORLD, ON-SPOT MENUS OR SOMETHING INBETWEEN
  #   MAY FIT BETTER YOUR USECASE, PLEASE REVIEW EVERYTHING POSSIBLE
  #   BEFORE DECIDING WHICH MENU TYPES YOU NEED 
###

## ANNOUNCE START
    tellraw @s [{text:"[+] ",color:"#c07300"},{translate:"leinad.menu.tellraw.start_create_menu",fallback:"Starting to create the menu"}]
##

## REMOVE OLD SETUP
    function lmenu:control/delete_main_fixed_setup
##

## CREATE NEW SETUP
    scoreboard players set #temp lcore.temp_condition 0
    scoreboard players set #temp1 lcore.temp_condition 0
    scoreboard players set #temp2 lcore.temp_condition 0
    $execute positioned $(x).0 $(y).0 $(z).0 run function lmenu:control/z/loop
    $execute as @e[tag=lmenu.main_menu] run rotate @s $(r1) $(r2)
##

## ANNOUNCE END
    tellraw @s [{text:"[!] ",color:"#ff9900"},{translate:"leinad.menu.tellraw.create_main_setup",fallback:"New fixed menu has been setup"}]
##
