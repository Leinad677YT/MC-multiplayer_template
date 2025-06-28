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

## REMOVE OLD SETUP
    execute store result score #temp l.core.temp_condition run kill @e[tag=l.menu.main_menu]
##
## ANNOUNCE
    tellraw @s [{text:"[!] ",color:"#ff9900"},{translate:"leinad.menu.tellraw.remove_main_setup",fallback:"You have removed %s entities from the main menu\n",with:[{score:{name:"#temp",objective:"l.core.temp_condition"},color:"#ff5555"}]},{translate:"leinad.debug.ensure_all_ok",fallback:"   > remember to ensure everything is okay",color:"dark_gray"}]
##
