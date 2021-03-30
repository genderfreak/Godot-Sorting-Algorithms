extends Node

onready var ArrayGenerator = get_parent().get_node("Array Generator")
export var debug = true

func _ready():
	if debug == true:
		pass

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
