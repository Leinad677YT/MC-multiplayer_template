data remove storage leinad_temp:teamdata raw.suffix
###### SUF 1
execute if score @s lteam.suf1 matches 1 run data modify storage leinad_temp:teamdata raw.suffix.1 set value [{text:" 🪙",color:"gold",bold:true,hover_event: {action: "show_text",value: {translate:"leinad.team.suffix.donor"}}}]
                # 
###### SUF 2
execute if score @s lteam.suf2 matches 1 run data modify storage leinad_temp:teamdata raw.suffix.2 set value [{text:" β",color:"aqua",bold:true,hover_event: {action: "show_text",value: {translate:"leinad.team.suffix.beta"}}}]
                # 
###### SUF 3
execute if score @s lteam.suf3 matches 1 run data modify storage leinad_temp:teamdata raw.suffix.3 set value [{text:" 🛡",color:"gray",bold:true,hover_event: {action: "show_text",value: {translate:"leinad.team.suffix.ungriefer"}}}]
                # 