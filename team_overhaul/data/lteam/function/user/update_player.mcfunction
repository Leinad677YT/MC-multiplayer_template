##                       requirements ~ {name:"PLAYER"}                     ##
#                                                                            #
# > "PLAYER" = string of the player name that you want to change             #
#   · function foo:bar {name:"Leinad677YT"} would be a functioning example   #
##                                                                          ##

## SETTING NAME
    $team add z_p$(name)
##

## RESET TEXTS
    $data modify storage leinad_temp:teamdata macro set value {name:"$(name)",prefix:[],suffix:""}
##

## GET TEAM MODIFICATIONS
    function #zleinad_pack_manager:call/team/get_teamdata with storage leinad_temp:teamdata macro
##

## [ DATA -> TEXT ] CONVERSION
    
    
    ## RESOLVE TEXT
        # remember that you can add as many lines as you need if the data fits on the sign
        
        # prefix
        data modify block 15 1 15 front_text.messages[0] set value [{nbt: "raw.prefix",storage: "leinad_temp:teamdata",interpret:true}]
        # suffix
        data modify block 15 1 15 front_text.messages[1] set value [{nbt: "raw.suffix",storage: "leinad_temp:teamdata",interpret:true}]
    ##

    ## MOVE TEXT TO STORAGE
        data modify storage leinad_temp:teamdata macro.prefix set from block 15 1 15 front_text.messages[0]
        data modify storage leinad_temp:teamdata macro.suffix set from block 15 1 15 front_text.messages[1]
    ##

    ## [ DATA -> PREFIX / SUFFIX ] CONVERSION
        function lteam:user/change_team_data with storage leinad_temp:teamdata macro
    ##
##

## PLACE PLAYER ON TEAM
    $team join z_p$(name) @s
##

## CLEAR STORAGE
    data remove storage leinad_temp:teamdata macro
##