# Replace (FindLength > 1)
execute if score #StringLib.FindLength StringLib matches 2.. run return run function stringlib:zprivate/replace/check_word_rest

# Replace (FindLength = 1)
data modify storage stringlib:temp data.CheckString.String set from storage stringlib:temp data.String
data modify storage stringlib:input concat append from storage stringlib:temp data.StringBefore[]
data modify storage stringlib:input concat append from storage stringlib:input replace.Replace
data modify storage stringlib:temp data.StringBefore set value []
return run scoreboard players add #StringLib.ReturnValue StringLib 1
