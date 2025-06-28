### WARNINGS
 ## LOG FILLER
  #  ONCE THIS MODULE GETS ENABLED, UNINSTALLING IT WILL SEND A LOT
  #  OF LOG MESSAGES BECAUSE OF THE ENTITIES WITH THE ENCHANTMENT 
###

## TELLRAW
    tellraw @s [{translate:"leinad.hit_det.tellraw.uninstall",fallback:"l.hit_det has been uninstalled"}]
##
## REMOVE SCOREBOARDS
        scoreboard objectives remove l.hit_det.is_invulnerable
        scoreboard objectives remove l.hit_det.attacked_by
        scoreboard objectives remove l.hit_det.attacked_by_player
##
