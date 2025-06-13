
execute if score @s lteam.pref matches -677 run return run data modify storage leinad_temp:teamdata raw.prefix set value {text:" [NUTRIA] ",color:"#1939b0",bold:true, hover_event: {action: "show_text", value: {translate:"leinad.team.prefix.leinad"}}}

execute if score @s lteam.pref matches 1 run return run data modify storage leinad_temp:teamdata raw.prefix set value {text:" [VIP] ",color:"light_purple",bold:true, hover_event: {action: "show_text", value: {translate:"leinad.team.prefix.vip"}}}
                # 
execute if score @s lteam.pref matches 2 run return run data modify storage leinad_temp:teamdata raw.prefix set value {text:" [FIC] ",color:"aqua", bold:true, hover_event: {action: "show_text", value: {translate:".team.prefix.fic"}}}
                # 
execute if score @s lteam.pref matches 3 run return run data modify storage leinad_temp:teamdata raw.prefix set value {text:" [GRUPO DE INGLÉS] ", color:"#721AC9", bold:true, hover_event: {action: "show_text", value: {translate:"espuki"}}}
                #
data modify storage leinad_temp:teamdata raw.prefix set value {text:" [DEFAULT] ", color:"aqua", bold:true, hover_event: {action: "show_text", value: {translate:"leinad.team.prefix.default"}}}
                # 
