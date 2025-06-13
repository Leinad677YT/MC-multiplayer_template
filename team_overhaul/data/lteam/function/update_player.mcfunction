##                       requirements ~ {name:"PLAYER"}                     ##
#                                                                            #
# > "PLAYER" = string of the player name that you want to change             #
#   · function foo:bar {name:"Leinad677YT"} would be a functioning example   #
##                                                                          ##

## IN CASE YOU DON'T WANT TO DELETE TEAMS ON DISCONNECTION, CHANGE COMMENTED LINE
  # $execute unless entity @s[tag=has_team] run team add $(name)
    $team add z_p$(name)
##

## GET VISUAL MODIFICATIONS
    function lteam:get_prefix
    function lteam:get_suffix
##

## RESET TEXTS
    $data modify storage leinad_temp:teamdata macro set value {name:"$(name)",prefix:"",suffix:""}
##

## [ DATA -> TEXT ] CONVERSION
    
    setblock 0 -64 0 oak_sign
    
    ## RESOLVE TEXT
        # remember that you can add as many lines as you need if the data fits on the sign
        
        # prefix
        data modify block 0 -64 0 front_text.messages[0] set value [{nbt: "raw.prefix","storage": "leinad_temp:teamdata","interpret":true}]
        # suffix
        data modify block 0 -64 0 front_text.messages[1] set value [{storage: "leinad_temp:teamdata",nbt: "raw.suffix.1",interpret:true},{storage: "leinad_temp:teamdata",nbt: "raw.suffix.2",interpret:true},{storage: "leinad_temp:teamdata",nbt: "raw.suffix.3",interpret:true}]
    ##

    ## MOVE TEXT TO STORAGE
        data modify storage leinad_temp:teamdata macro.prefix set from block 0 -64 0 front_text.messages[0]
        data modify storage leinad_temp:teamdata macro.suffix set from block 0 -64 0 front_text.messages[1]
    ##

    ## [ DATA -> PREFIX / SUFFIX ] CONVERSION
        function lteam:change_team_data with storage leinad_temp:teamdata macro
    ##

    setblock 0 -64 0 bedrock
##

## PLACE PLAYER ON TEAM
    $team join z_p$(name) @s
##