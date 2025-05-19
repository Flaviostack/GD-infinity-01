extends CharacterBody2D

const SPEED = 3.0
@export var type = "Enemie"

func atualizar_coordenadas():
	var coordenadas = $coordenada
	coordenadas.clear()
	coordenadas.add_text("Y = " + str(position.y))

func eliminar_objeto():
		if position.y >= 680:
			queue_free()
			#print("destruído")

func cair():
	position.y += SPEED

func _physics_process(delta: float) -> void:
	cair()
	atualizar_coordenadas()
	eliminar_objeto()
	
