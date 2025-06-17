execute store result score #temp1 lcore.temp_condition run scoreboard players operation #temp lcore.temp_condition = @s llogin.session_id
execute store result storage leinad_temp:menu slot.x int 1 run scoreboard players operation #temp lcore.temp_condition %= #points_per_row llogin.session_id
execute store result storage leinad_temp:menu slot.z int 1 run scoreboard players operation #temp1 lcore.temp_condition /= #points_per_row llogin.session_id

    execute store result storage leinad_temp:menu slot.stage int 1 run scoreboard players get @s lmenu.stage_secondary

    function lmenu:control/get_stage



gamemode spectator
spectate
advancement revoke @s from lmenu:parent/key_press_any
advancement grant @s only lmenu:key_press/crouch enabler

function lmenu:go_to with storage leinad_temp:menu slot
function lmenu:load_stage with storage leinad_temp:menu slot

function lmenu:key_press/macro/get_next with storage leinad_temp:menu slot

function lmenu:stage_changed
