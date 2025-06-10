## REMOVE ENTITIES
    $scoreboard players operation #temp lmenu.player_id = $(name) lmenu.player_id
    kill @e[predicate=lmenu:display_from_player,scores={lmenu.entity_type=10}]
##

## ENABLE OTHER MENUS
    $scoreboard players reset $(name) lmenu.can_use_menu
##
