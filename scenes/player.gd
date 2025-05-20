extends CharacterBody2D

const SPEED = 300.0

@export var vida = 3
@export var projetil : PackedScene


func mostra_vida():
	var mostra_vida = $Vida
	mostra_vida.clear()
	if vida>0:
		mostra_vida.add_text(str(vida))
	else:
		mostra_vida.add_text("Tu Se lascou!")
		get_tree().change_scene_to_file("res://scenes/menu.tscn")

func atirar():
	var mira = $Mira
	var this_projetil = projetil.instantiate()
	this_projetil.position = mira.global_position
	get_parent().add_child(this_projetil)
	
func controlar():
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if position.y != 570:
		position.y = 570
		
	if Input.is_action_just_pressed("atack"):
		atirar()

func verificar_colisao():
	for i in get_slide_collision_count():
		var colisao = get_slide_collision(i)
		print("colidiou com:", colisao.get_collider())
		var colisor = colisao.get_collider()
		 
		if colisor.is_in_group("Enemie"):
			vida = vida-1
			colisor.queue_free()

func _physics_process(delta: float) -> void:
	# As good practice, you should replace UI actions with custom gameplay actions.
	controlar()		
	move_and_slide()
	verificar_colisao()	
	mostra_vida()
