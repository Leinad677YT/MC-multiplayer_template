## SURROUND WITH SPACE
    # prefix
    data modify storage leinad_temp:teamdata raw.prefix append value {text:" "}
    $data modify storage leinad_temp:teamdata raw.prefix append value {player:{name:"$(name)"}}
    data modify storage leinad_temp:teamdata raw.prefix append value {text:" ",color:"#0"}
    #suffix
    data modify storage leinad_temp:teamdata raw.suffix append value {text:" ",color:"#0"}
##

## PREFIX
    # personal
    execute if entity @s[tag=zl.tag.nutria] run data modify storage leinad_temp:teamdata raw.prefix append from storage zl.visual:text nutria.txt[]
    # fic
    execute if entity @s[tag=zl.tag.fic] run data modify storage leinad_temp:teamdata raw.prefix append from storage zl.visual:text fic.txt[]
    execute if entity @s[tag=zl.tag.ingles] run data modify storage leinad_temp:teamdata raw.prefix append from storage zl.visual:text ingles.txt[]
    # other
    execute if entity @s[tag=zl.tag.vip] run data modify storage leinad_temp:teamdata raw.prefix append from storage zl.visual:text vip.txt[]
##

## SUFFIX
    # paid
    execute if entity @s[tag=zl.tag.donor] run data modify storage leinad_temp:teamdata raw.suffix prepend from storage zl.visual:text donor.txt[]
##
