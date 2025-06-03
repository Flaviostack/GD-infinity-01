extends Node2D
var papo_reto = [
	{
	"Nome": "Ratão",
	"Fala": "Você conseguiu chegar longe, gatinho."
	},
	{
		"Nome": "Ratão",
		"Fala": "Mas agora você vai virar queijo"
		}
]
var index_fala = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bater_papo_reto()

func bater_papo_reto():
	var proza_da_vez = papo_reto[index_fala]
	$Nome_Label.text = proza_da_vez["Nome"]
	$Fala_Label.text = proza_da_vez["Fala"]

func _on_proximo_btn_pressed() -> void:
	index_fala += 1
	if index_fala >= papo_reto.size():
		index_fala = 0
	bater_papo_reto()
