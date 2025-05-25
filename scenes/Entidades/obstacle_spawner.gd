extends Node2D
@export var obstacle_scene : PackedScene
@export var spawn_area_width = 580

var on_enemy_defeated : Callable
func set_enemy_defeated_callback(cb:Callable):
	on_enemy_defeated = cb


func eliminar_objetos(obstacle):
		if obstacle.position.y >= 600:
			print("saiu da tela")
	#eliminar objetos que saem da tela

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_timer_timeout() -> void:
	if not obstacle_scene:
		print("não tem obstáculo, chefe")
		return
	var obstacle = obstacle_scene.instantiate()
	
	
	var spawn_x = randf_range(0, spawn_area_width)
	obstacle.position = Vector2(spawn_x, 0)
	if on_enemy_defeated:
		obstacle.connect("defeated", on_enemy_defeated)
	get_parent().add_child(obstacle)
#	obstacle.connect("defeated", Callable(get_tree().get_root().get_node("Main"), "_on_enemy_defeated"))
	
	eliminar_objetos(obstacle)
