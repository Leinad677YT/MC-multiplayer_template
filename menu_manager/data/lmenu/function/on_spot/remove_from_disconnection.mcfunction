## REMOVE ENTITIES
    $scoreboard players operation #temp lplayer.id = $(name) lplayer.id
    kill @e[predicate=lmenu:display_from_player,scores={lmenu.entity_type=10}]
##

## ENABLE OTHER MENUS
    $scoreboard players reset $(name) lmenu.can_use_menu
##
