extends Control

@export var cena_inicial : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_start_pressed() -> void:
	$click.play()
	await get_tree().create_timer(0.1).timeout
	get_tree().change_scene_to_packed(cena_inicial)


func _on_exit_pressed() -> void:
	$click.play()
	get_tree().quit()#sai do jogo mano
