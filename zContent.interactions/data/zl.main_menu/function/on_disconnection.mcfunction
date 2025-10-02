## NOT PLAYING HUB => RETURN
    execute unless data storage leinad_perm:online session[{leaving:1b,mode:"hub"}] run return fail
##

## SAVE
    function l.user:player/save with storage leinad_perm:online session[{leaving:1b}]
    function zl.main_menu:menu/remove_displays with storage leinad_perm:online session[{leaving:1b}]
##
