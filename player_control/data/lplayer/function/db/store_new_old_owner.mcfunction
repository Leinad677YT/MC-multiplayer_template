# if data is in root, copy from there and remove residual data
$execute if data storage z_p$(name):root data{id:$(id)} run data modify storage z_p$(newname):root data set from storage z_p$(name):root data
$execute if data storage z_p(name):root data{id:$(id)} run return run data remove storage z_p$(name):root data
# else, copy from id and remove residual data
$data modify storage z_p$(newname):root data set from storage z_p$(name):$(id) data
$data remove storage z_p$(name):$(id) data