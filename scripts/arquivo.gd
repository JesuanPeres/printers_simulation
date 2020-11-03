extends Node2D

var vel = 250

func _ready():
	set_process(true)
	pass 

func _process(delta):
	set_position(get_position() + Vector2(1, 1) * vel * delta)
	pass

