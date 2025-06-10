### WARNINGS
 ## CHUNK LOADING
  #  ALL MENUS THAT ARE NOT CURRENTLY LOADED WILL BE LOST TO TIME, PLEASE ENSURE THAT YOU
  #  CAN COMPLETELY UNINSTALL THIS BEFORE DOING SO
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

## REMOVE "VISIBLE" MENUS
    function lmenu:control/delete_main_fixed_setup
    kill @e[scores={lmenu.entity_type=10}]
##
## TELLRAW
    tellraw @s [{translate:"leinad.menu.tellraw.uninstall",fallback:"lmenu has been uninnstalled"}]
##
## ADD SCOREBOARDS
    scoreboard objectives remove lmenu.temp_condition

    scoreboard objectives remove lmenu.session_id

    scoreboard objectives remove lmenu.owner_id
    scoreboard objectives remove lmenu.player_id
    scoreboard objectives remove lmenu.entity_id
    scoreboard objectives remove lmenu.entity_type
    
    scoreboard objectives remove lmenu.stage_main

    scoreboard objectives remove lmenu.stage_secondary
    scoreboard objectives remove lmenu.can_use_menu
##
