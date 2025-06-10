### WARNINGS
 ## SCORES
  #  THIS FUNCTION CALL MOVES PLAYERS TO THE MAIN MENU, PLEASE REMEMBER TO SET THEIR
  #  MAIN AND SECONDARY SCORES ACCORDINGLY
 ## PLAYER LOADING
  #  ENSURE THAT THE MENU IS LOADED FOR THE PLAYER BEFORE SENDING THEM INSIDE, OTHERWISE
  #   THEY WILL NOT BE SPECTATING THE ROOT DISPLAY
###

execute store result score #temp1 lmenu.temp_condition run scoreboard players operation #temp lmenu.temp_condition = @s lmenu.session_id
execute store result storage leinad_temp:menu slot.x int 1 run scoreboard players operation #temp lmenu.temp_condition %= #points_per_row lmenu.session_id
execute store result storage leinad_temp:menu slot.z int 1 run scoreboard players operation #temp1 lmenu.temp_condition /= #points_per_row lmenu.session_id

    execute store result storage leinad_temp:menu slot.stage int 1 run scoreboard players get @s lmenu.stage_secondary

    function lmenu:control/get_stage


gamemode spectator

advancement revoke @s from lmenu:parent/key_press_any
advancement grant @s only lmenu:key_press/crouch enabler

function lmenu:go_to with storage leinad_temp:menu slot
function lmenu:load_stage with storage leinad_temp:menu slot

function lmenu:key_press/macro/get_next with storage leinad_temp:menu slot

function lmenu:stage_changed
