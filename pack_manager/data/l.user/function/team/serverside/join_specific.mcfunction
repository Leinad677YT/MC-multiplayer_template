##                    requirements ~ {target:"PLAYER"}                      ##
#                                                                            #
# > "PLAYER" = string of the player name that you want to go with            #
#   · function l.user:team/serverside/invite {target:"Name_of_player"}        #
##                                                                          ##

## PLAYER WAS INVITED?
    $execute unless score @s l.team.invited_to = $(target) l.team.current run return run tellraw @s [{text:"",color:"#ff5522"},{text:"[+] ",color:"dark_aqua"},{translate: "leinad.team.were_not_invited"}]
##

## JOIN

    ## SET SCORES
        $scoreboard players operation @s l.team.current = $(target) l.team.current
        scoreboard players set @s l.team.invited_to -2
        $scoreboard players set $(target) l.team.invited -3
    ##

    ## SET TEMP SCORE
        scoreboard players operation #temp l.team.current = @s l.team.current
    ##
    
    ## tellraw @s current team ID + members
        tellraw @s [{text:""},{text: "[+] ",color:"dark_aqua"},{text:"TEAM ID: ",color:"#555555"},{score:{name: "@s",objective: "l.team.current"},color:"#555555"},{text:"\n[^] ",color:"dark_aqua"},{translate: "leinad.team.tellraw.current_members",color:"gray"},{text:":\n ",color:"gray"},{selector: "@a[predicate=l.team:same_serverside_team]"}]
    ##
##