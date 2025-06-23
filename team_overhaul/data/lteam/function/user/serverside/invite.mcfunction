##                    requirements ~ {target:"PLAYER"}                      ##
#                                                                            #
# > "PLAYER" = string of the player name that you want to invite             #
#   · function lteam:user/serverside/invite {target:"Name_of_player"}        #
##                                                                          ##

## IF TRIES TO INVITE SELF
    # FOR WHATEVER REASON
        # STOP    
    $execute if entity @s[name="$(target)"] run return run tellraw @s [{text:"",color:"#ff5522"},{text:"[+] ",color:"dark_aqua"},{translate:"leinad.team.cannot_invite_self"}]
##

## IF NO SUCH PLAYER, STOP
    $execute unless entity $(target) run return run tellraw @s [{text:"",color:"#ff5522"},{text:"[+] ",color:"dark_aqua"},{text:"$(target) "},{translate:"leinad.player.is_not_online"}]
##

## IF NEEDED, CREATE NEW TEAM
    execute unless score @s lteam.current = @s lteam.current run scoreboard players add #new lteam.current 1
    execute unless score @s lteam.current = @s lteam.current run scoreboard players operation @s lteam.current = #new lteam.current
##

## TELLRAW ON BOTH SIDES
    tellraw @s [{text:"[+] ",color:"dark_aqua"},{translate:"leinad.team.invite_sent",color:"gray"}]
    $tellraw $(target) [{text:""},{text:"[+]",color:"dark_aqua"},{"selector": "@s"},{text:" "},{translate: "leinad.team.invite_received",color:"gray"}]
##

## ENABLE LATEST // PERPLAYER
    $scoreboard players operation $(target) lteam.invited_to = @s lteam.current
    $scoreboard players operation @s lteam.invited = $(target) lplayer.id
##