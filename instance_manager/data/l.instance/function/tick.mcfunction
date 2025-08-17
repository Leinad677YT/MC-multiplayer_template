## NO PLAYERS WAITING => DO NOTHING
    execute unless data storage leinad_perm:instance waiting[0] run return fail
##

## IF PLAYERS WAITING, FILTER BY GROUP
    data modify storage leinad_temp:instance waiting_dupe set from storage leinad_perm:instance waiting
    function l.instance:zaux/waiting_loop with storage leinad_temp:instance waiting_dupe[-1]
##
