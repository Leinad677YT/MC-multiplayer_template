# Check if last character matches
data modify storage stringlib:temp data.LastChar set string storage stringlib:temp data.String -1
execute store success score #StringLib.SuccessCheck StringLib run data modify storage stringlib:temp data.LastChar set string storage stringlib:input replace.Find -1
execute if score #StringLib.SuccessCheck StringLib matches 0 if function stringlib:zprivate/replace/reversed/replace run return 0

# Next loop (Stop once the word can no longer fit, or if it's been found already)
execute if score #StringLib.Index StringLib matches 0 run return run scoreboard players set #StringLib.FoundNothing StringLib 1
scoreboard players remove #StringLib.Index StringLib 1
data modify storage stringlib:temp data.StringAfter prepend string storage stringlib:temp data.String -1
data modify storage stringlib:temp data.String set string storage stringlib:temp data.String 0 -1
function stringlib:zprivate/replace/reversed/check_word_start_loop
