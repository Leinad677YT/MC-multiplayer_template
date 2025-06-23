### WARNINGS
 ## LOG FILLER
  #  ONCE THIS MODULE GETS ENABLED, UNINSTALLING IT WILL SEND A LOT
  #  OF LOG MESSAGES BECAUSE OF THE ENTITIES WITH THE ENCHANTMENT 
###

## TELLRAW
    tellraw @s [{translate:"leinad.hit_det.tellraw.uninstall",fallback:"lhitdet has been uninstalled"}]
##
## REMOVE SCOREBOARDS
        scoreboard objectives remove lhitdet.is_invulnerable
        scoreboard objectives remove lhitdet.attacked_by
        scoreboard objectives remove lhitdet.attacked_by_player
##
