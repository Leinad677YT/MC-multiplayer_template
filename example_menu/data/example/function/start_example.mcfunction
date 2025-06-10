scoreboard players set @s lmenu.stage_main 2000
scoreboard players set @s lmenu.stage_secondary 0
function lmenu:on_spot/remove
function lmenu:user/assign

execute if score @s lmenu.can_use_menu matches -2147483648..2147483647 run tellraw @s [{text:"",color:"dark_red"},{translate:"leinad.menu.tellraw.left_menu_hanging",fallback:"You could have just left a menu hanging around without first removing it, be cautious when changing menus"}]
