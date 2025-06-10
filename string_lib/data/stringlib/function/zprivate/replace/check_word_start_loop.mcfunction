# Check if first character matches
data modify storage stringlib:temp data.FirstChar set string storage stringlib:temp data.String 0 1
execute store success score #StringLib.SuccessCheck StringLib run data modify storage stringlib:temp data.FirstChar set string storage stringlib:input replace.Find 0 1
execute if score #StringLib.SuccessCheck StringLib matches 0 if function stringlib:zprivate/replace/replace run return 0

# Next loop (Stop once the word can no longer fit, or if it's been found already)
execute if score #StringLib.Index StringLib > #StringLib.CharsTotal StringLib run return run scoreboard players set #StringLib.FoundNothing StringLib 1
scoreboard players add #StringLib.Index StringLib 1
data modify storage stringlib:temp data.StringBefore append string storage stringlib:temp data.String 0 1
data modify storage stringlib:temp data.String set string storage stringlib:temp data.String 1
function stringlib:zprivate/replace/check_word_start_loop
