extends Node2D

var fila = []
var msg = " na fila"
onready var label = get_node("Label")

var printer1_free = true
var printer2_free = true

signal send_printer_1
signal send_printer_2

func _ready():
	get_node("../computer1/path_computer1").connect("file_in_server", self, "_on_file_arrive")
	get_node("../computer2/path_computer2").connect("file_in_server", self, "_on_file_arrive")
	get_node("../computer3/path_computer3").connect("file_in_server", self, "_on_file_arrive")
	get_node("../computer4/path_computer4").connect("file_in_server", self, "_on_file_arrive")
	
	get_node("../printer1/path_printer1").connect("printer1_free", self, "_on_printer1_free")
	get_node("../printer2/path_printer2").connect("printer2_free", self, "_on_printer2_free")
	
	set_process(true)

func _process(delta):
	label.text = str(fila.size()) + msg
	if !fila.empty() and printer1_free:
		emit_signal("send_printer_1")
		printer1_free = false
		fila.pop_front()
	if !fila.empty() and printer2_free:
		emit_signal("send_printer_2")
		printer2_free = false
		fila.pop_front()
		
	#print(fila)
	
func _on_file_arrive():
	fila.push_back(1)
	
func _on_printer1_free():
	printer1_free = true
	
func _on_printer2_free():
	printer2_free = true
