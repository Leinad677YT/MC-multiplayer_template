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

## DIND'T READ
    execute if score #z_i_need_this_to_avoid_people_from_not_reading_readmes lmenu.stage_main matches 1 run data modify storage leinad_temp:menu loaded set value 1b
    execute unless data storage leinad_temp:menu {loaded:1b} run return run tellraw @s [{text:"",color:"#ff9900"},{text:"[!] ",color:"#9e0000"},{translate:"leinad.debug.load_function_not_executed",fallback:"You didn't follow the README file, try again later C:"}]
##

## ANNOUNCE START
    tellraw @s [{text:"[+] ",color:"#c07300"},{translate:"leinad.menu.tellraw.start_create_menu",fallback:"Starting to create the menu"}]
##

## REMOVE OLD SETUP
    function lmenu:control/delete_main_fixed_setup
##

## CREATE NEW SETUP
    scoreboard players set #temp lmenu.temp_condition 0
    scoreboard players set #temp1 lmenu.temp_condition 0
    scoreboard players set #temp2 lmenu.temp_condition 0
    $execute positioned $(x).0 $(y).0 $(z).0 run function lmenu:control/z/loop
    $execute as @e[tag=lmenu.main_menu] run rotate @s $(r1) $(r2)
##

## ANNOUNCE END
    tellraw @s [{text:"[!] ",color:"#ff9900"},{translate:"leinad.menu.tellraw.create_main_setup",fallback:"New fixed menu has been setup"}]
##
