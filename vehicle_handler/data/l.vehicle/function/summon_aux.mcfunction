## ADD TAGS
    tag @s add zl.vehicle.root
    tag @s add zl.vehicle.current
##

## REDIRECT TO SUMMON FUNCTION
    $function #l.user:vehicle/$(type) with storage l.vehicle:data $(type)
##

## REMOVE TEMP DATA
    tag @s remove zl.vehicle.current
##
