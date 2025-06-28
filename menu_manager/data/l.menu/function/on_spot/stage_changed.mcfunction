 playsound block.amethyst_block.resonate player @s ~ ~ ~ 1 1 1
## EXECUTE function
    scoreboard players operation #temp l.player.id = @s l.player.id
    execute if data storage leinad_temp:menu next.function run function l.menu:do_nested_function with storage leinad_temp:menu next
##
## ENABLE ADVANCEMENTS
    advancement grant @s only l.menu:on_spot/key_press/none enabler
    advancement revoke @s from l.menu:parent/key_press
    advancement grant @s only l.menu:on_spot/key_press/none enabler
    
    execute if data storage leinad_temp:menu next.adv_r run advancement grant @s only l.menu:on_spot/key_press/right enabler
    execute if data storage leinad_temp:menu next.adv_l run advancement grant @s only l.menu:on_spot/key_press/left enabler
    execute if data storage leinad_temp:menu next.adv_u run advancement grant @s only l.menu:on_spot/key_press/up enabler
    execute if data storage leinad_temp:menu next.adv_d run advancement grant @s only l.menu:on_spot/key_press/down enabler

    execute if data storage leinad_temp:menu next.adv_j run advancement grant @s only l.menu:on_spot/key_press/jump enabler
    execute if data storage leinad_temp:menu next.adv_s run advancement grant @s only l.menu:on_spot/key_press/sprint enabler
##