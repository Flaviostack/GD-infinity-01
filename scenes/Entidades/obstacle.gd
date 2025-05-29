extends CharacterBody2D

@export var speed_base = 15
var speed = speed_base * 10
@export var type = "Rocha"

signal defeated

func atualizar_coordenadas():
	var coordenadas = $coordenada
	coordenadas.clear()
	coordenadas.add_text("Y = " + str(position.y))

func eliminar_objeto():
	if position.y >= 680:
		queue_free()

func cair(delta):
	position.y += speed * delta

func _physics_process(delta: float) -> void:
	cair(delta)
	atualizar_coordenadas()
	eliminar_objeto()
