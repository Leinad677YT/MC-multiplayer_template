## this is the path of the data that you want to use, all inside l.menu:data


    execute if score @s l.menu.stage_main matches -2147483648 run data modify storage leinad_temp:menu slot.menu set value "main"
    execute if score @s l.menu.stage_main matches -2147483648 run data modify storage leinad_temp:menu temp.menu set value "main"
    # execute if score @s l.menu.stage_main matches 2000 run data modify storage leinad_temp:menu slot.menu set value "example"
    # execute if score @s l.menu.stage_main matches 2000 run data modify storage leinad_temp:menu temp.menu set value "example"
