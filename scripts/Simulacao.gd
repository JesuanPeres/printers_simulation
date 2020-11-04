extends Node2D

var rng = RandomNumberGenerator.new()
signal print_computer1
signal print_computer2
signal print_computer3
signal print_computer4

#const TIME_PERIOD = 0.5
var time = 0.0
var processos = 0

var exponential = 2.718281828
var lambda = 23
var k = 15
var num_processos = 0

var ic = 0.0
var ta = 0.0
var tc = 0.0

var contador_ic = 0.0
var contador_ta = 0.0
var contador_tc = 0.0

func _ready():
	set_process(true)

func _process(delta):  
	time += delta
	if processos <= 136 and time >= contador_ic*60:
		var random = rand()
		ic = calcula_ic(random[1]) #Tempo entre geração dos arquivos
		ta = calcula_ta(random[1]) #Tempo entre o servidor e a impressora
		tc = calcula_tc() 		   #Tempo entre o pc e o servidor
		contador_ic += ic
		contador_ta += ta
		contador_tc += tc
		processos += 1
		var a =  rng.randi_range(1, 4)

		if a == 1:
			emit_signal("print_computer1")
			
		if a == 2:
			emit_signal("print_computer2")
			
		if a == 3:
			emit_signal("print_computer3")
			
		if a == 4:
			emit_signal("print_computer4")
				
func rand():
	var a = 16807
	var m = pow(2,31) - 1
	var c = 0
	var last_numbers = []                      
	var integer = []
	integer.append(OS.get_system_time_msecs())

	for i in range(1,3):
		integer.append(MOD(integer[i-1] * a  + c, m))
		last_numbers.append(division(integer[i],m)) 
		
	return last_numbers

func MOD(number, divisor):
	return fmod(number, divisor)
	
func division(num1: float, num2: float) -> float:
	return num1/num2

func calcula_ic(num_rand):
	return -(log(1-num_rand)/log(exponential))/lambda

func calcula_ta(num_rand):
	return -(log(1-num_rand)/log(exponential))/k
	
func calcula_tc():
	return ic + contador_tc
