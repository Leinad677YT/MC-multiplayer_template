## GET DATA
    data modify storage leinad_temp:login scores set from storage leinad_perm:data saved_scores
    scoreboard players operation #scores_left l.core.temp_condition = #saved_scores l.core.temp_condition
##
## SET PLAYER NAME
    $data modify storage leinad_temp:login scores[{}].name set value "$(name)"
##
## COPY TO TEMP STORAGE
    function l.player:score/save_scores_ with storage leinad_temp:login scores[-1]
##

## SAVE TO STORAGE
    $function l.player:score/save_scores_update with storage leinad_perm:online session[{name:"$(name)"}]
##

data remove storage leinad_temp:login scores
data remove storage leinad_temp:login scores_