$execute store result storage leinad_temp:login scores_.$(objective) int 1 run scoreboard players get $(name) $(objective)
execute if score #scores_left l.core.temp_condition matches ..1 run return fail

## MOVE LIST POSITION
    scoreboard players remove #scores_left l.core.temp_condition 1
    data remove storage leinad_temp:login scores[-1]
##

function l.player:score/save_scores_ with storage leinad_temp:login scores[-1]