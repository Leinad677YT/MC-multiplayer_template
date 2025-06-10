##########################################################################################################
##                                              HOW TO USE                                              ##
##########################################################################################################
## 1. Set the following data in the 'stringlib:input insert' data storage:                              ##
##    - String: Original string                                                                         ##
##    - Insertion: String you want to insert                                                            ##
##    - Index: Position for the Insertion                                                               ##
## 2. Run this function with the 'stringlib:input insert' data storage                                  ##
##                                                                                                      ##
## Output: A single combined string                                                                     ##
##         Example:                                                                                     ##
##                 - String: "Hello!"                                                                   ##
##                 - Insertion: " World"                                                                ##
##                 - Index: 5                                                                           ##
##                 => Output: "Hello World!"                                                            ##
##                                                                                                      ##
## The output is found in the 'stringlib:output insert' data storage                                    ##
##########################################################################################################

# Insert
$data modify storage stringlib:temp data.S1 set string storage stringlib:input insert.String 0 $(Index)
$data modify storage stringlib:temp data.S2 set string storage stringlib:input insert.String $(Index)
data modify storage stringlib:temp data.I set from storage stringlib:input insert.Insertion
function stringlib:zprivate/insert/main with storage stringlib:temp data
data remove storage stringlib:temp data
