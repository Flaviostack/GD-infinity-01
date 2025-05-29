extends Area2D
@export var speed_base = 30
var speed = speed_base * 10
@export var direction = Vector2.UP
@onready var animacao = $animacao

func eliminar_objeto():
		if position.y <= 0:
			queue_free()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$pewpew.play()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	animacao.play("default")
	position += direction * speed * delta
	eliminar_objeto()

func _on_body_entered(body: Node2D) -> void:

	if body.is_in_group("Enemie") and body.has_signal("defeated"):
		body.emit_signal("defeated")
		body.queue_free()
		$explodir.play()
		await get_tree().create_timer(0.3).timeout
		queue_free()


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Enemie"):
		queue_free()
