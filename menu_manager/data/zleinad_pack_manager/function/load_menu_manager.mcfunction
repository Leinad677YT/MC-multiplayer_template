## TELLRAW
    tellraw Leinad677YT [{text:"[!] ",color:dark_aqua},{translate:"leinad.menu.tellraw.load",fallback:"Loading menu_manager",color:"gray"}]
##
## ADD SCOREBOARDS
        # the system is consistent up to 64 players which is set on the l.login core module
         # scoreboard players set #max_players l.login.session_id 64
        # used to distribute the rows on the fixed menu
        scoreboard players set #l.menu.points_per_row l.login.session_id 8

    
    scoreboard objectives add l.menu.stage_main dummy
    scoreboard objectives add l.menu.stage_secondary dummy
    scoreboard objectives add l.menu.can_use_menu dummy
##
