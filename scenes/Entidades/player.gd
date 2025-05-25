extends CharacterBody2D
#onready vars
@onready var animacao = $animacao

const velocidade = 300.0
var SPEED = velocidade

signal vida_change(new_vida)
@export var vida = 100

@export var projetil : PackedScene

func levar_dano(dano : int):
	vida = vida - dano
	emit_signal("vida_change", vida)

func mostra_vida():
	var mostra_vida = $Vida
	mostra_vida.clear()
	if vida>0:
		mostra_vida.add_text(str(vida))
	else:
		mostra_vida.add_text("Tu Se lascou!")
		get_tree().change_scene_to_file("res://scenes/outros/menu.tscn")

func atirar():
	var mira = $Mira
	var this_projetil = projetil.instantiate()
	this_projetil.position = mira.global_position
	this_projetil.scale.x = 2
	this_projetil.scale.y = 2
	get_parent().add_child(this_projetil)
	
func controlar():
	animacao.play("parado")
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	#verificar posição nas paredes
	#baixo
	if position.y != 570:
		position.y = 570
	#esquerda	
	if position.x <= 20:
		position.x = 20	
	#direita
	if position.x > 710:
		position.x = 710

#atirar
	if Input.is_action_just_pressed("atack"):
		atirar()

func verificar_colisao():
	for i in get_slide_collision_count():
		var colisao = get_slide_collision(i)
		#print("colidiou com:", colisao.get_collider())
		var colisor = colisao.get_collider()
		 
		if colisor.is_in_group("Enemie"):
			colisor.queue_free()
			levar_dano(25)
			animacao.play("machucado")

func _physics_process(delta: float) -> void:
	# As good practice, you should replace UI actions with custom gameplay actions.
	controlar()		
	move_and_slide()
	verificar_colisao()	
	mostra_vida()
