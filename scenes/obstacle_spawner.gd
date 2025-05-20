extends Node2D
@export var obstacle_scene : PackedScene
@export var spawn_area_width = 580

func eliminar_objetos(obstacle):
		if obstacle.position.y >= 600:
			print("saiu da tela")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	#eliminar objetos que saem da tela
	

func _on_timer_timeout() -> void:
	if not obstacle_scene:
		print("não tem obstáculo, chefe")
		return
	var obstacle = obstacle_scene.instantiate()
	var spawn_x = randf_range(0, spawn_area_width)
	obstacle.position = Vector2(spawn_x, 0)
	get_parent().add_child(obstacle)
	
	eliminar_objetos(obstacle)
