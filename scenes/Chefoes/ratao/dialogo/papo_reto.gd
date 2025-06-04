extends Node2D

# Array que vai armazenar as falas lidas do arquivo JSON
var papo_reto = []
var index_fala = 0
signal fala_acabou

# Variáveis para animação de escrita
var texto_completo = ""
var texto_atual = ""
var char_index = 0
var escrevendo = false
var velocidade = 0.03 # segundos por letra

func trocar_de_cena(cena):
	get_tree().change_scene_to_file(cena)

func _ready() -> void:
	# Verifica se o arquivo de diálogo existe
	if FileAccess.file_exists("res://dialogos/bosses/boss_rat.json"):
		# Abre o arquivo para leitura
		var file = FileAccess.open("res://dialogos/bosses/boss_rat.json", FileAccess.READ)
		if file:
			# Lê todo o conteúdo do arquivo como texto
			var json_text = file.get_as_text()
			file.close()

			# Cria um objeto JSON e faz o parse do texto lido
			var json = JSON.new()
			var json_result = json.parse(json_text)
			if json_result == OK:
				papo_reto = json.data
			else:
				# Se houve erro no parse, mostra mensagem no console
				print("Erro ao parsear JSON:", json.get_error_message())
		else:
			print("Erro ao abrir o arquivo.")
	else:
		# Se o arquivo não existe, mostra mensagem no console
		print("Arquivo dialogo.json não encontrado!")

	# Mostra a primeira fala ao iniciar
	bater_papo_reto()

# Função para exibir a fala atual na tela
func bater_papo_reto():
	if papo_reto.size() == 0:
		return
	
	# Pega o dicionário da fala atual pelo índice
	var proza_da_vez = papo_reto[index_fala]
	# Atualiza o texto dos labels na tela com nome e fala
	$Nome_Label.text = proza_da_vez["Nome"]
	texto_completo = proza_da_vez["Fala"]
	texto_atual = ""
	char_index = 0
	escrevendo = true
	$Fala_Label.text = ""
	# Inicia a animação de escrita
	set_process(true)

func _process(delta):
	if escrevendo:
		if char_index < texto_completo.length():
			texto_atual += texto_completo[char_index]
			$Fala_Label.text = texto_atual
			char_index += 1
			await get_tree().create_timer(velocidade).timeout
		else:
			escrevendo = false
			set_process(false)

func _on_proximo_btn_pressed() -> void:
	if escrevendo:
		# Se ainda está escrevendo, mostra o texto completo imediatamente
		escrevendo = false
		$Fala_Label.text = texto_completo
		set_process(false)
	else:
		index_fala += 1
		if index_fala >= papo_reto.size():
			index_fala = 0
			trocar_de_cena("res://scenes/Chefoes/ratao/boss_fight.tscn")
		bater_papo_reto()

		
