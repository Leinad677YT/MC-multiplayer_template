### WARNINGS
 ## SCORES
  #  THIS FUNCTION CALL MOVES PLAYERS TO THE MAIN MENU, PLEASE REMEMBER TO SET THEIR
  #  MAIN AND SECONDARY SCORES ACCORDINGLY
 ## PLAYER LOADING
  #  ENSURE THAT THE MENU IS LOADED FOR THE PLAYER BEFORE SENDING THEM INSIDE, OTHERWISE
  #   THEY WILL NOT BE SPECTATING THE ROOT DISPLAY
###

execute store result score #temp1 l.core.temp_condition run scoreboard players operation #temp l.core.temp_condition = @s l.login.session_id
execute store result storage leinad_temp:menu slot.x int 1 run scoreboard players operation #temp l.core.temp_condition %= #points_per_row l.login.session_id
execute store result storage leinad_temp:menu slot.z int 1 run scoreboard players operation #temp1 l.core.temp_condition /= #points_per_row l.login.session_id

    execute store result storage leinad_temp:menu slot.stage int 1 run scoreboard players get @s l.menu.stage_secondary

    function l.menu:control/get_stage


gamemode spectator

advancement revoke @s from l.menu:parent/key_press_any
advancement grant @s only l.menu:key_press/crouch enabler

function l.menu:go_to with storage leinad_temp:menu slot
function l.menu:load_stage with storage leinad_temp:menu slot

function l.menu:key_press/macro/get_next with storage leinad_temp:menu slot

function l.menu:stage_changed
