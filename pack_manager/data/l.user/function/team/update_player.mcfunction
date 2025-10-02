##                       requirements ~ {name:"PLAYER"}                     ##
#                                                                            #
# > "PLAYER" = string of the player name that you want to change             #
#   · function foo:bar {name:"Leinad677YT"} would be a functioning example   #
##                                                                          ##

## SETTING NAME
    $team add z_p$(name)
##

## RESET TEXTS
    data remove storage leinad_temp:teamdata raw
    $data modify storage leinad_temp:teamdata macro set value {name:"$(name)",prefix:[],suffix:[]}
##

## GET TEAM MODIFICATIONS
    function #zleinad_pack_manager:call/team/get_teamdata with storage leinad_temp:teamdata macro
##

## [ DATA -> TEXT ] CONVERSION
    
    
    ## RESOLVE TEXT
        # remember that you can add as many lines as you need if the data fits on the sign
        
        # prefix
        execute in l.core:void run data modify block 15 1 15 front_text.messages[0] set value [{nbt: "raw.prefix",storage: "leinad_temp:teamdata",interpret:true}]
        # suffix
        execute in l.core:void run data modify block 15 1 15 front_text.messages[1] set value [{nbt: "raw.suffix",storage: "leinad_temp:teamdata",interpret:true}]
    ##

    ## MOVE TEXT TO STORAGE
        execute in l.core:void run data modify storage leinad_temp:teamdata macro.prefix set from block 15 1 15 front_text.messages[0]
        execute in l.core:void run data modify storage leinad_temp:teamdata macro.suffix set from block 15 1 15 front_text.messages[1]
    ##

    ## [ DATA -> PREFIX / SUFFIX ] CONVERSION
        function l.user:team/restore_pref_suf with storage leinad_temp:teamdata raw
        execute if data storage leinad_temp:teamdata raw.prefix[0] run function l.user:team/change_team_prefix with storage leinad_temp:teamdata macro
        execute if data storage leinad_temp:teamdata raw.suffix[0] run function l.user:team/change_team_suffix with storage leinad_temp:teamdata macro
    ##
##

## PLACE PLAYER ON TEAM
    $team join z_p$(name) @s
##

## CLEAR STORAGE
    data remove storage leinad_temp:teamdata macro
##