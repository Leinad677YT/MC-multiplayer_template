$execute store result score @s $(objective) run data get storage z_p$(lower):root data.scores.$(objective)
execute if score #scores_left lcore.temp_condition matches ..1 run return fail

## MOVE LIST POSITION
    scoreboard players remove #scores_left lcore.temp_condition 1
    data remove storage leinad_temp:login scores[-1]
##

function lplayer:score/retrieve_ with storage leinad_temp:login scores[-1]