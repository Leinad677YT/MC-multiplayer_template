## TELLRAW
    tellraw Leinad677YT [{text:"[!] ",color:dark_aqua},{translate:"leinad.menu.tellraw.load",fallback:"Loading menu_manager",color:"gray"}]
##
## ADD SCOREBOARDS
    scoreboard objectives add llogin.session_id dummy
        # the system is consistent up to 64 players which is set on the llogin core module
         # scoreboard players set #max_players llogin.session_id 64
        # used to distribute the rows on the fixed menu
        scoreboard players set #lmenu.points_per_row llogin.session_id 8

    
    scoreboard objectives add lmenu.stage_main dummy
    scoreboard objectives add lmenu.stage_secondary dummy
    scoreboard objectives add lmenu.can_use_menu dummy
##
