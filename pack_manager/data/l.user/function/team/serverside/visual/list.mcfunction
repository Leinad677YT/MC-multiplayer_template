## Lists players on your current team

## IF NEEDED, CREATE NEW TEAM
    execute unless score @s l.team.current = @s l.team.current store result score @s l.team.current run scoreboard players add #new l.team.current 1
##

## TELLRAW

    ## TEMP SCORE
        scoreboard players operation #temp l.team.current = @s l.team.current
    ##

    ## tellraw @s current team ID + members
        tellraw @s [{text:""},{text: "[+] ",color:"dark_aqua"},{text:"TEAM ID: ",color:"#555555"},{score:{name: "@s",objective: "l.team.current"}, color:"#555555"},{text:"\n[^] ",color:"dark_aqua"},{translate: "leinad.team.tellraw.current_members",color:"gray"},{text:":\n ",color:"gray"},{selector: "@a[predicate=l.team:same_serverside_team]"}]
    ##
##
