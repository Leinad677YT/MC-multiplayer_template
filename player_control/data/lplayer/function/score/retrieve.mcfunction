## GET DATA
    data modify storage leinad_temp:login scores set from storage leinad_perm:data saved_scores
    scoreboard players operation #scores_left lcore.temp_condition = #saved_scores lcore.temp_condition
##
## SET PLAYER NAME
    $data modify storage leinad_temp:login scores[{}].lower set value "$(lower)"
##
## COPY TO TEMP STORAGE
    function lplayer:score/retrieve_ with storage leinad_temp:login scores[-1]
##

data remove storage leinad_temp:login scores