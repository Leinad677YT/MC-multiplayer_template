## NOT PLAYING SURVIVAL => RETURN
    execute unless data storage leinad_perm:online session[{leaving:1b,mode:"survival"}] run return fail
##

## SAVE
    $function l.user:player/save {name:$(name)}
##
