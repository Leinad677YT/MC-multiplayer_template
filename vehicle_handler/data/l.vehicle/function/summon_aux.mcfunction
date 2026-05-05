## ADD TAGS
    tag @s add zl.vehicle.root
    tag @s add zl.vehicle.current
    $data modify entity @s data.l.vehicle.type set value "$(type)"
##

## REDIRECT TO SUMMON FUNCTION
    $function #l.user:vehicle/$(type)_main with storage l.vehicle:data $(type)
##

## REMOVE TEMP DATA
    tag @s remove zl.vehicle.current
##
