##########################################################################################################
##                                              HOW TO USE                                              ##
##########################################################################################################
## 1. Run this function with the 'Input' macro variable set to what you want to convert to a number     ##
##                                                                                                      ##
## Output: Numeric version of your input                                                                ##
##         Example: "500.25" => 500.25                                                                  ##
##                                                                                                      ##
## The output is found in the 'stringlib:output to_number' data storage                                 ##
##########################################################################################################

$data modify storage stringlib:output to_number set value $(Input)
