##                    requirements ~ {target:"PLAYER"}                      ##
#                                                                            #
# > "PLAYER" = string of the player name that you want to go with            #
#   · function lteam:user/serverside/invite {target:"Name_of_player"}        #
##                                                                          ##

## PLAYER WAS INVITED?
    $execute unless score @s lteam.invited_to = $(target) lteam.current run return run tellraw @s [{text:"",color:"#ff5522"},{text:"[+] ",color:"dark_aqua"},{translate: "leinad.team.were_not_invited"}]
##

## JOIN

    ## SET SCORES
        $scoreboard players operation @s lteam.current = $(target) lteam.current
        scoreboard players set @s lteam.invited_to -2
        $scoreboard players set $(target) lteam.invited -3
    ##

    ## SET TEMP SCORE
        scoreboard players operation #temp lteam.current = @s lteam.current
    ##
    
    ## tellraw @s current team ID + members
        tellraw @s [{text:""},{text: "[+] ",color:"dark_aqua"},{text:"TEAM ID: ",color:"#555555"},{score:{name: "@s",objective: "lteam.current"},color:"#555555"},{text:"\n[^] ",color:"dark_aqua"},{translate: "leinad.team.tellraw.current_members",color:"gray"},{text:":\n ",color:"gray"},{selector: "@a[predicate=lteam:same_serverside_team]"}]
    ##
##