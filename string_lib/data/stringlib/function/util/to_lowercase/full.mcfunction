##########################################################################################################
##                                              HOW TO USE                                              ##
##########################################################################################################
## 1. Run this function with the 'String' macro variable set to what you want to convert to lowercase   ##
##    Note: This function will cover the entire unicode range of letters, but is also noticeably slower ##
##                                                                                                      ##
## Output: Lowercase version of your input                                                              ##
##         Example: "ABC" => "abc"                                                                      ##
##                                                                                                      ##
## The output is found in the 'stringlib:output to_lowercase' data storage                              ##
##########################################################################################################

# Setup
$data modify storage stringlib:temp data.Input set value "$(String)"
execute store result score #StringLib.CharsLeft StringLib run data get storage stringlib:temp data.Input
data modify storage stringlib:temp data.Char set string storage stringlib:temp data.Input 0 1

# Capitalize each character
function stringlib:zprivate/to_lowercase/main_full with storage stringlib:temp data

# Combine the characters again
data modify storage stringlib:temp data2.PrevInput set from storage stringlib:input concat
data modify storage stringlib:temp data2.PrevOutput set from storage stringlib:output concat

data modify storage stringlib:input concat set from storage stringlib:temp data.CharList
function stringlib:util/concat
data modify storage stringlib:output to_lowercase set from storage stringlib:output concat

data modify storage stringlib:input concat set from storage stringlib:temp data2.PrevInput
data modify storage stringlib:output concat set from storage stringlib:temp data2.PrevOutput
execute unless data storage stringlib:temp data2.PrevInput run data remove storage stringlib:input concat
execute unless data storage stringlib:temp data2.PrevOutput run data remove storage stringlib:output concat

# Reset
data remove storage stringlib:temp data2
