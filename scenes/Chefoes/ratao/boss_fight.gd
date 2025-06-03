extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$HUD/Control/Score.visible = false
	$Player.connect("vida_change", $HUD.atualizar_vida)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var direction = $Player.global_position - $Ratao/mira.global_position
	$Ratao/mira.rotation = direction.angle()
