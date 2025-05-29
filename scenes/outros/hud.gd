extends CanvasLayer


func atualizar_vida(this_vida : int):
	$Control/LifeSlider.value = this_vida
	 
func update_Score(newScore):
	$Control/Score.text = "Score: %d" %newScore
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var katinho_anim = $Control/LifeSlider/katinho
	katinho_anim.play("default")
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
