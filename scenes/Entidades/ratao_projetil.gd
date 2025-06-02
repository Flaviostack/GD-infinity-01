extends 'res://scenes/Entidades/energy_ball.gd'

var direction = Vector2.ZERO
func _process(delta):
	position += direction * speed * delta
