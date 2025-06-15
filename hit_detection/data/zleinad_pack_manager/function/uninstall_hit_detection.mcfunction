### WARNINGS
 ## LOG FILLER
  #  ONCE THIS MODULE GETS ENABLED, UNINSTALLING IT WILL SEND A LOT
  #  OF LOG MESSAGES BECAUSE OF THE ENTITIES WITH THE ENCHANTMENT 
 ## ENTITY DETECTION
  #  ANY ENTITY THAT ALREADY HAS AN ID ***WILL NOT BE DETECTABLE***
  #  AFTER YOU UNINSTALL THIS PACK, MOST ENTITIES WILL NEED MANUAL
  #  REHABILITATION AND WILL HAVE AN ITEM ON THEIR ARMOR SLOTS, 
  #  DON'T USE THIS MODULE IN MOSTLY SURVIVAL RELATED MAPS UNLESS YOU
  #  WANT TO STICK WITH IT UNTIL THE END  
###

## TELLRAW
    tellraw @s [{translate:"leinad.hit_det.tellraw.uninstall",fallback:"lhitdet has been uninstalled"}]
##
## ADD SCOREBOARDS
        scoreboard objectives remove lhitdet.is_invulnerable
        scoreboard objectives remove lhitdet.attacked_by
        scoreboard objectives remove lhitdet.attacked_by_player
##
