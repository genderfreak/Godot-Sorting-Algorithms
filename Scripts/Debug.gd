extends Control

onready var ArrayGenerator = $"Array Generator"
onready var ArraySorter = $"Array Sorter"
onready var debug_label = $"ScrollContainer/Debug Label"
onready var time_label = $"Time Label"

var sorting = false
var cur_arr
var thread
var elapsed = 31475858000

func _ready():
	pass

func _process(delta):
	time_label.text = "Elapsed time: %d:%d.%d" % [elapsed/1000/60, elapsed/1000%60, elapsed%1000]
	if typeof(cur_arr) != 0:
		debug_label.text = ArrayGenerator.get_str(cur_arr)
#	if sorting:
#		var data = ArraySorter.bubble_sort_step(cur_arr)
#		cur_arr = data.array
#		sorting = false if data.done else true
#		debug_label.text = ArrayGenerator.get_str(cur_arr)

func _on_Test_Button_pressed():
	var arr = ArrayGenerator.get_new_arr(1000)
	cur_arr = arr
	sorting = true
	thread = Thread.new()
	thread.start(self, "testSort", 0)

# d is delay
func testSort(d):
	var start_t = OS.get_ticks_msec()
	while sorting:
		OS.delay_msec(d)
		var data = ArraySorter.bubble_sort_step(cur_arr)
		cur_arr = data.array
		sorting = false if data.done else true
	var end_t = OS.get_ticks_msec()
	elapsed = end_t - start_t

#func _exit_tree():
#	thread.wait_to_finish()
