extends Sprite

var direccion = Vector2()
var danio = 15


func disparar(origen = Vector2(), destino = Vector2()):
	direccion = origen.direction_to(destino)


func _physics_process(delta):
	if direccion:
		global_position += direccion * delta * 400
