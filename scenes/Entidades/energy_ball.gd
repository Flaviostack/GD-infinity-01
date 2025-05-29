extends Area2D
@export var speed_base = 100
var speed = speed_base * 10

func cair(delta):
	var anim = $EnergyBall_anim
	anim.play("default")
	position.y += speed*delta
	if position.y > 700:
		queue_free()
		
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	cair(delta)
	
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player_atack"):
		body.queue_free()
	
	if body.is_in_group("Player"):
		body.levar_dano(30)
		queue_free()
