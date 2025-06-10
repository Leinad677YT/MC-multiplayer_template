# Convert current character to uppercase (& handle a character having 2 possible outputs)
data remove storage stringlib:temp data.List
$data modify storage stringlib:temp data.List append from storage stringlib:zprivate data.CharMap.Full[{l:"$(Char)"}].u
data modify storage stringlib:temp data.CharList append from storage stringlib:temp data.List[0]
execute unless data storage stringlib:temp data.List run data modify storage stringlib:temp data.CharList append from storage stringlib:temp data.Char

# Next loop
execute if score #StringLib.CharsLeft StringLib matches 1 run return 0
scoreboard players remove #StringLib.CharsLeft StringLib 1
data modify storage stringlib:temp data.Input set string storage stringlib:temp data.Input 1
data modify storage stringlib:temp data.Char set string storage stringlib:temp data.Input 0 1
function stringlib:zprivate/to_uppercase/main_full with storage stringlib:temp data
