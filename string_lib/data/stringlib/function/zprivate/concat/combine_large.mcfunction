# Combine up to 100 strings at once (Size=100 adds 100 to the current result, so it's 101 afterwards)
$function stringlib:zprivate/concat/s/$(Size)

# Next loop
execute if score #StringLib.ConcatsLeft StringLib matches 1 run return 0
scoreboard players remove #StringLib.ConcatsLeft StringLib 1
execute if score #StringLib.ConcatsLeft StringLib matches 1 store result storage stringlib:temp data.Size byte 1 run scoreboard players get #StringLib.StringsTotal StringLib
execute if score #StringLib.ConcatsLeft StringLib matches 2.. run data modify storage stringlib:temp data.Size set value 100b
function stringlib:zprivate/concat/combine_large with storage stringlib:temp data
