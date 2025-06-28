## REMOVE ENTITIES
    $scoreboard players operation #temp l.player.id = $(name) l.player.id
    kill @e[predicate=l.menu:display_from_player,scores={l.core.entity_type=10}]
##

## ENABLE OTHER MENUS
    $scoreboard players reset $(name) l.menu.can_use_menu
##
