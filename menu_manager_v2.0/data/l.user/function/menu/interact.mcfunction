## GET DATA FOR EASY ACCESS
    $data modify storage leinad_temp:menu interaction set from storage l.menu:$(main) $(secondary).t_$(trigger)
##

## FUNCTION AND STAGE CHANGES
    execute if data storage leinad_temp:menu interaction.function run function l.menu:zaux/redirect with storage leinad_temp:menu interaction
    execute if data storage leinad_temp:menu interaction.main run function l.user:menu/change_stage with storage leinad_temp:menu interaction
##

## REMOVE TEMP DATA
    data remove storage leinad_temp:menu interaction
##