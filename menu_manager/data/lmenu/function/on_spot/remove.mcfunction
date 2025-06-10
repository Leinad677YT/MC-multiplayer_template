## REMOVE ENTITIES
    scoreboard players operation #temp lmenu.player_id = @s lmenu.player_id
    kill @e[predicate=lmenu:display_from_player,scores={lmenu.entity_type=10}]
##

## ENABLE OWN MOVEMENT AGAIN
    attribute @s movement_speed modifier remove control:movement_speed
    attribute @s jump_strength modifier remove control:jump_strength
##

## ENABLE OTHER MENUS
    scoreboard players reset @s lmenu.can_use_menu
##

## REMOVE INPUT DETECTION
    advancement revoke @s from lmenu:parent/key_press_any
##