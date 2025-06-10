## TELLRAW
    tellraw @s [{translate:"leinad.menu.tellraw.load",fallback:"lmenu is now loaded"}]
##
## ADD SCOREBOARDS
    scoreboard objectives add lmenu.temp_condition dummy

    scoreboard objectives add lmenu.session_id dummy
        # the datapack is consistent up to 64 but you may not need that many
        scoreboard players set #max_players lmenu.session_id 64
        scoreboard players set #points_per_row lmenu.session_id 8

    scoreboard objectives add lmenu.owner_id dummy
    scoreboard objectives add lmenu.player_id dummy
    scoreboard objectives add lmenu.entity_id dummy
    scoreboard objectives add lmenu.entity_type dummy
        # 10 = on-spot_menus
    
    scoreboard objectives add lmenu.stage_main dummy
        scoreboard players set #z_i_need_this_to_avoid_people_from_not_reading_readmes lmenu.stage_main 1
    scoreboard objectives add lmenu.stage_secondary dummy
    scoreboard objectives add lmenu.can_use_menu dummy
##
