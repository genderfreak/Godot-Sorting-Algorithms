extends Node

export var debug = false

func _ready():
	if debug == true: print(get_new_arr(100))

func get_new_arr(r):
	var arr = []
	for i in range(r):
		arr.append(i)
	arr.shuffle()
	return arr

func get_num_scale(num, r):
	return num/r
