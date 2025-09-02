## EXECUTE ALL CLEARING TOOLS
    # bvol
    execute if entity @s[tag=l.inf_gen.clear_bvol] at @s run function l.inf_gen:clear/bvol with entity @s data
    # evol
    execute if entity @s[tag=l.inf_gen.clear_evol] at @s run function l.inf_gen:clear/evol with entity @s data
    # cplace
    execute if entity @s[tag=l.inf_gen.clear_cplace] at @s run function l.inf_gen:clear/cplace with entity @s data
    # cfunct
    execute if entity @s[tag=l.inf_gen.clear_cfunct] at @s run function l.inf_gen:clear/cfunct with entity @s data
##
