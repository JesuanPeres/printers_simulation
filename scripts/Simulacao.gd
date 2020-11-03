extends Node2D

var rng = RandomNumberGenerator.new()
signal print_computer1
signal print_computer2
signal print_computer3
signal print_computer4

const TIME_PERIOD = 0.5
var time = 0
var processos = 0

func _ready():
	set_process(true)

func _process(delta):
	time += delta
	if processos <= 136:
		var probabilidade = poisson()
		var random = rand()
		if probabilidade > random[1] and time > TIME_PERIOD:
			processos += 1
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

func poisson():
	var k = 15
	var landa = 135/6
	var exponential = 2.718281828
	var numerator
	var denominator
	var exponentialPower = pow(exponential, -landa)
	var landaPowerK = pow(landa, k)
	numerator = exponentialPower * landaPowerK
	denominator = fact(k)
	
	if k > 40:
		return 0
	else:	
		return (numerator / denominator)


func fact(x):
	if(x==0):
		return 1
	return x * fact(x-1)
