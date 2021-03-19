extends Node

onready var ArrayGenerator = get_parent().get_node("Array Generator")
onready var Bar = get_parent().get_node("CenterContainer/HBoxContainer/Bar")
export var debug = true

func _ready():
	if debug == true:
		bubble_sort_test()

func bubble_sort_step(arr):
	var i = 0
	var done = true
	while i < arr.size() - 1:
		if arr[i] > arr[i+1]:
			var tx = arr[i+1]
			arr[i+1] = arr[i]
			arr[i] = tx
			done = false
		i += 1
	return { "array": arr, "done": done }

func bubble_sort_test():
	var arr = ArrayGenerator.get_new_arr(100)
	var sorted_arr = arr
	var done = false
	while !done:
		var data = bubble_sort_step(sorted_arr)
		done = data.done
		sorted_arr = data.array
		Bar.rect_scale.y = sorted_arr[49]
	print(sorted_arr)
