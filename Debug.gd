extends Control

onready var ArrayGenerator = $"Array Generator"
onready var ArraySorter = $"Array Sorter"
onready var debug_label = $"CenterContainer/VBoxContainer/Debug Label"

func _ready():
	pass


func _process(delta):
	pass

func _on_Test_Button_pressed():
	var arr = ArrayGenerator.get_new_arr(1000)
	var sorted_arr = arr
	var done = false
	while !done:
		var data = ArraySorter.bubble_sort_step(sorted_arr)
		done = data.done
		sorted_arr = data.array
		debug_label.text = ArrayGenerator.get_str(sorted_arr)
