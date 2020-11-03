extends Path2D

onready var follow = get_node("follow")
onready var pathSize = get_curve().get_baked_length()
onready var sprite = follow.get_node("Sprite")
signal file_in_server
var send = false
var sending = false

func _ready():
	get_node("../../../Simulacao").connect("print_computer4", self, "_on_print")
	sprite.visible = false
	set_process(true)

func _process(delta):
	var offset = follow.get_offset()
	var newOffset = 0
	if sending:
		if offset < pathSize - 10:
			newOffset = offset + 150 * delta
		else:
			sending = false
			sprite.visible = false
			emit_signal("file_in_server")
		follow.set_offset(newOffset)
	elif send:
		sprite.visible = true
		sending = true
		send = false

func _on_print():		
	if !sending:
		send = true
