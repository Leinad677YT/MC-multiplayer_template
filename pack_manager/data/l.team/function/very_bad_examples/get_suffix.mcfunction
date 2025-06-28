
execute if score @s l.team.suff matches 1 run data modify storage leinad_temp:teamdata raw.suffix set value [{text:" 🪙",color:"gold",bold:true,hover_event: {action: "show_text",value: {translate:"leinad.team.suffix.money"}}}]
