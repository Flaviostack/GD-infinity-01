extends CharacterBody2D

const SPEED = 300.0
@export var vida = 3

func mostra_vida():
	var mostra_vida = $Vida
	mostra_vida.clear()
	if vida>0:
		mostra_vida.add_text(str(vida))
	else:
		mostra_vida.add_text("Tu Se lascou!")
		get_tree().paused = true

	
func verificar_colisao():
	for i in get_slide_collision_count():
		var colisao = get_slide_collision(i)
		print("colidiou com:", colisao.get_collider())
		var colisor = colisao.get_collider()
		 
		if colisor.is_in_group("Enimie"):
			vida = vida-1
			colisor.queue_free()
func _physics_process(delta: float) -> void:
	
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if position.y != 570:
		position.y = 570
			
	move_and_slide()
	verificar_colisao()	
	mostra_vida()
