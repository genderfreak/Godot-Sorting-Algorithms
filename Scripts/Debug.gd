extends Control

onready var ArrayGenerator = $"Array Generator"
onready var ArraySorter = $"Array Sorter"
onready var debug_label = $"ScrollContainer/Debug Label"
onready var time_label = $"Time Label"
onready var size_label = $"Size Label"
onready var size_slider = $"Size Slider"
onready var method_options = $"Method Options"

var sorting = false
var cur_arr
var thread
var elapsed = 17380 # ay

export var delay = 0

func _ready():
	for i in ArraySorter.METHODS:
		method_options.add_item(i)

func _process(delta):
	# set time label
	time_label.text = "Elapsed time: %d:%d.%d" % [elapsed/1000/60, elapsed/1000%60, elapsed%1000]
	# update slider label
	size_label.text = str(size_slider.value)
	# set main label to current array content
	if typeof(cur_arr) != 0:
		debug_label.text = ArrayGenerator.get_str(cur_arr)
#	if sorting:
#		var data = ArraySorter.bubble_sort_step(cur_arr)
#		cur_arr = data.array
#		sorting = false if data.done else true
#		debug_label.text = ArrayGenerator.get_str(cur_arr)

func _on_Test_Button_pressed():
	print(typeof(thread))
	if typeof(thread):
		print(thread.is_active())
	if typeof(thread) == 0 || !thread.is_active():
		thread = Thread.new()
		var arr = ArrayGenerator.get_new_arr(size_slider.value)
		cur_arr = arr
		sorting = true
		thread.start(self, "testSort", delay)

# d is delay
func testSort(d):
	var start_t = OS.get_ticks_msec()
	while sorting:
		method_options.disabled = true
		OS.delay_msec(d)
		var data = ArraySorter.call(method_options.get_item_text(method_options.selected), cur_arr)
		cur_arr = data.array
		sorting = false if data.done else true
	var end_t = OS.get_ticks_msec()
	elapsed = end_t - start_t
	method_options.disabled = false
	thread.call_deferred("wait_to_finish")

#func _exit_tree():
#	thread.wait_to_finish()
