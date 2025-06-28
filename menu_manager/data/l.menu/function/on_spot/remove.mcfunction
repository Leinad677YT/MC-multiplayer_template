## REMOVE ENTITIES
    scoreboard players operation #temp l.player.id = @s l.player.id
    kill @e[predicate=l.menu:display_from_player,scores={l.core.entity_type=10}]
##

## ENABLE OWN MOVEMENT AGAIN
    attribute @s movement_speed modifier remove control:movement_speed
    attribute @s jump_strength modifier remove control:jump_strength
##

## ENABLE OTHER MENUS
    scoreboard players reset @s l.menu.can_use_menu
##

## REMOVE INPUT DETECTION
    advancement revoke @s from l.menu:parent/key_press_any
##