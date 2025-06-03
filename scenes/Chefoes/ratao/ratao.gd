extends Area2D
@export var speed_base = 25
var speed = speed_base * 10
var direcao = 1

@export var vida_base = 300
var vida = vida_base

@export var projetil:PackedScene

func morrer():
	if vida <= 0:
		get_tree().paused = true

func levar_dano(dano):
	vida -= dano
	print("Vida antes:", vida + dano, " | Vida depois:", vida)
	print("Barra existe?", $vida_do_ratao)
	$vida_do_ratao.value = vida
	morrer()
	
func atirar():
	var player = get_tree().get_root().get_node("BossFight/Player")
	var direction = (player.global_position - global_position).normalized()
	var this_projetil = projetil.instantiate()
	
	this_projetil.global_position = $mira.global_position
	this_projetil.direction = direction
	
	this_projetil.scale.x = 2
	this_projetil.scale.y = 2
	get_parent().add_child(this_projetil)	
	
func mover_pro_lado(delta):
	position.x += speed*delta*direcao
	if position.x > 640:
		direcao = -1
	elif position.x <= 80:
		direcao = 1
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	vida = vida_base
	 # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	mover_pro_lado(delta)

func _on_timer_timeout() -> void:
	atirar()
