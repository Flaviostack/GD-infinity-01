extends CharacterBody2D

@export var speed_base = 15
var speed = speed_base * 10

@export var type = "Enemie"

func verificar_colisao():
	for i in get_slide_collision_count():
		var colisao = get_slide_collision(i)
		print("colidiou com:", colisao.get_collider())
		var colisor = colisao.get_collider()
		 
		if colisor.is_in_group("player_atack"):
			colisor.queue_free()

func atualizar_coordenadas():
	var coordenadas = $coordenada
	coordenadas.clear()
	coordenadas.add_text("Y = " + str(position.y))

func eliminar_objeto():
		if position.y >= 680:
			queue_free()
			#print("destruído")

func cair(delta):
	position.y += speed * delta

func _physics_process(delta: float) -> void:
	cair(delta)
	verificar_colisao()
	atualizar_coordenadas()
	eliminar_objeto()
	
