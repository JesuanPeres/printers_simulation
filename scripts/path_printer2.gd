extends Path2D

onready var follow = get_node("follow")
onready var pathSize = get_curve().get_baked_length()
var send = false
var sending = false

signal printer2_free

func _ready():
	get_node("../../server").connect("send_printer_2", self, "_on_send")
	set_process(true)

	
func _process(delta):
	var offset = follow.get_offset()
	var newOffset = 0
	if sending:
		if offset < pathSize - 10:
			newOffset = offset + 150 * delta
		else:
			sending = false
			emit_signal("printer2_free")
		follow.set_offset(newOffset)
	elif send:
		sending = true
		send = false
		
func _on_send():
	send = true
