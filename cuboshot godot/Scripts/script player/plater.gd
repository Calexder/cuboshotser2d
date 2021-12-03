extends KinematicBody2D

export var movimiento = 100
var balade = preload("res://esenas/armas/bala.tscn") # bala precargada



var velocidad = Vector2()
#movimiento 
func get_input():
	velocidad = Vector2()
	
	if Input.is_action_pressed("mirarderecha"):
		velocidad.x += 1
		$cubopla.animation = "Cderbajo"
	if Input.is_action_pressed("mirarizquierda"):
		velocidad.x -= 1
		$cubopla.animation = "Cizabajo"
	if Input.is_action_pressed("mirarariba"):
		velocidad.y -= 1
		$cubopla.animation = "Carriba"
	if Input.is_action_pressed("mirarbajo"):
		velocidad.y += 1
		$cubopla.animation = "idl"

#mirando si la bala dispara
	if Input.is_action_just_pressed("fayaa"):
		var balainstanciada = balade.instance()
		balainstanciada.disparar($balaori.global_position, get_global_mouse_position())
		balainstanciada.global_position = $balaori.global_position
		add_child(balainstanciada)
		
	velocidad = velocidad.normalized() * movimiento

func _physics_process(_delta):
	get_input()
	velocidad = move_and_slide(velocidad)
