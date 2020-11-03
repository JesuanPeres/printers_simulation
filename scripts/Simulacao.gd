extends Node2D

var rng = RandomNumberGenerator.new()
signal print_computer1
signal print_computer2
signal print_computer3
signal print_computer4

const TIME_PERIOD = 0.5
var time = 0

func _ready():
	set_process(true)

func _process(delta):
	time += delta
	if Input.is_action_pressed("ui_accept") and time > TIME_PERIOD:
		time = 0
		var a =  rng.randi_range(1, 4)

		if a == 1:
			emit_signal("print_computer1")
			
		if a == 2:
			emit_signal("print_computer2")
			
		if a == 3:
			emit_signal("print_computer3")
			
		if a == 4:
			emit_signal("print_computer4")
