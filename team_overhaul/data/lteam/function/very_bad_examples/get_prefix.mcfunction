
execute if score @s lteam.pref matches -677 run return run data modify storage leinad_temp:teamdata raw.prefix set value [{translate:"leinad.team.prefix.itsame",fallback:" [NUTRIA] ",color:"#1939b0",bold:true, hover_event: {action: "show_text", value: {translate:"leinad.team.prefix.leinad"}}}]

execute if score @s lteam.pref matches 1 run return run data modify storage leinad_temp:teamdata raw.prefix set value [{text:" [1] ",color:"light_purple",bold:true, hover_event: {action: "show_text", value: {translate:"leinad.team.prefix.e"}}}]
                # 
execute if score @s lteam.pref matches 2 run return run data modify storage leinad_temp:teamdata raw.prefix set value [{text:" [2] ",color:"aqua", bold:true, hover_event: {action: "show_text", value: {translate:".team.prefix.wow"}}}]
                #
data modify storage leinad_temp:teamdata raw.prefix set value [{text:" [DEFAULT] ", color:"aqua", bold:true, hover_event: {action: "show_text", value: {translate:"leinad.team.prefix.default"}}}]
                # 
