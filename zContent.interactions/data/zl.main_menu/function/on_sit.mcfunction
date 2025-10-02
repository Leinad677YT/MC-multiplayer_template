## NOT ON HUB => RETURN
    execute unless score @s l.menu.stage_main matches -677 run return fail
##

## ALREADY IN MENU => RETURN
    execute if entity @s[tag=l.menu.in_menu] run return fail
##

## GET PLAYERDATA
    execute store result storage leinad_temp:game main_menu.id int 1 run scoreboard players get @s l.player.id
    function zl.main_menu:zaux/get_playerdata with storage leinad_temp:game main_menu
##

## tag self and summon displays
    tag @s add l.menu.in_menu
    # text
    execute anchored eyes positioned ^ ^ ^ summon text_display run function zl.main_menu:menu/d_tmain_1 with storage leinad_temp:game main_menu
    execute anchored eyes positioned ^ ^ ^ summon text_display run function zl.main_menu:menu/d_tmain_2 with storage leinad_temp:game main_menu
    execute anchored eyes positioned ^ ^ ^ summon text_display run function zl.main_menu:menu/d_tmain_3 with storage leinad_temp:game main_menu
    execute anchored eyes positioned ^ ^ ^ summon text_display run function zl.main_menu:menu/d_tmain_4 with storage leinad_temp:game main_menu
    execute anchored eyes positioned ^ ^ ^ summon text_display run function zl.main_menu:menu/d_tmain_5 with storage leinad_temp:game main_menu
    execute anchored eyes positioned ^ ^ ^ summon text_display run function zl.main_menu:menu/d_tmain_6 with storage leinad_temp:game main_menu
    # item
    execute anchored eyes positioned ^ ^ ^ summon item_display run function zl.main_menu:menu/d_imain_1 with storage leinad_temp:game main_menu
    execute anchored eyes positioned ^ ^ ^ summon item_display run function zl.main_menu:menu/d_imain_2 with storage leinad_temp:game main_menu
    execute anchored eyes positioned ^ ^ ^ summon item_display run function zl.main_menu:menu/d_imain_3 with storage leinad_temp:game main_menu
##

## LOAD STAGE 0
    function l.user:menu/change_stage {main:-677,secondary:0}
    function zl.main_menu:menu/anim_start with storage leinad_temp:game main_menu
##

## REMOVE TEMP DATA
    data remove storage leinad_temp:game main_menu
##