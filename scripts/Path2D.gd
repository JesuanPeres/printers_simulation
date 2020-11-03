extends Path2D

onready var follow = get_node("follow")
onready var pathSize = get_curve().get_baked_length()

func _ready():
	set_process(true)

	
func _process(delta):
	var offset = follow.get_offset()
	if offset < pathSize - 10:
		follow.set_offset(follow.get_offset() + 150 * delta)
