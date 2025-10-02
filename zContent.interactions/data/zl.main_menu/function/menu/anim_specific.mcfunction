execute store result storage leinad_temp:game target_menu.id int 1 run scoreboard players get @s l.player.id

function zl.main_menu:zaux/get_playerdata_ with storage leinad_temp:game target_menu

$data modify storage leinad_temp:game target_menu.target set value $(target)

function zl.main_menu:menu/anim_specific_ with storage leinad_temp:game target_menu

data remove storage leinad_temp:game target_menu