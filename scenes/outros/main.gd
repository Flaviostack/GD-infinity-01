extends Node2D
var Score = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$ObstacleSpawner.set_enemy_defeated_callback(Callable(self, "on_enemy_defeated"))
	$Player.connect("vida_change", $HUD.atualizar_vida)

func on_enemy_defeated():
	Score += 1
	$HUD.update_Score(Score)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
