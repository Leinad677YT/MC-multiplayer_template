## NO NEED TO CALL => RETURN
    execute unless score @s l.room.inf_gen_leave matches ..-1 unless score @s l.room.inf_gen_leave matches 2.. run return fail
##

##
    function #zleinad_pack_manager:call/inf_gen/manage_join with storage leinad_temp:login session_
##

scoreboard players reset @s l.room.inf_gen_leave