extends CanvasLayer

@onready var container_configuracoes = $Pause/PanelContainer/Divisao/CantoDireito

@onready var slider_volume_geral = $Pause/PanelContainer/Divisao/CantoDireito/PanelContainer/MarginContainer/Configuracoes/Sliders_porcentagens/Sliders/VolumeGeral/HSlider
@onready var slider_volume_musica = $Pause/PanelContainer/Divisao/CantoDireito/PanelContainer/MarginContainer/Configuracoes/Sliders_porcentagens/Sliders/VolumeMusica/HSlider
@onready var slider_sensibilidade = $Pause/PanelContainer/Divisao/CantoDireito/PanelContainer/MarginContainer/Configuracoes/Sliders_porcentagens/Sliders/Sensibilidade/HSlider
@onready var checkBox_tela_cheia = $Pause/PanelContainer/Divisao/CantoDireito/PanelContainer/MarginContainer/Configuracoes/TelaCheia/CheckButtonTelaCheia

@onready var label_volume_geral = $Pause/PanelContainer/Divisao/CantoDireito/PanelContainer/MarginContainer/Configuracoes/Sliders_porcentagens/Porcentagens/LabelVolumeGeral
@onready var label_volume_musica = $Pause/PanelContainer/Divisao/CantoDireito/PanelContainer/MarginContainer/Configuracoes/Sliders_porcentagens/Porcentagens/labelVolumeMusica
@onready var label_sensibilidade = $Pause/PanelContainer/Divisao/CantoDireito/PanelContainer/MarginContainer/Configuracoes/Sliders_porcentagens/Porcentagens/LabelSensibilidade

func _ready() -> void:
	visible = false
	
	container_configuracoes.visible = false


func _on_visibility_changed() -> void:
	if(visible == true):		
		# Iniciando os sliders
		slider_volume_geral.value = int(Settings.volume_geral * 100)
		slider_volume_musica.value = int(Settings.volume_musica * 100)
		slider_sensibilidade.value = Settings.sensibilidade
		# Ajusta a opção de tela cheia bonitinho
		checkBox_tela_cheia.button_pressed = DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN
	
	GameState.setValue("pauseAberto", visible)
	GameState.setValue("podeAndar", !visible) # Desabilita o movimento e libera o mouse de acordo


func _on_sair_pressed() -> void:
	$ConfirmaSair.visible = true


func _on_sair_sim_pressed() -> void:
	get_tree().quit()


func _on_sair_nao_pressed() -> void:
	$ConfirmaSair.visible = false


func _on_continuar_pressed() -> void:
	self.visible = false
	container_configuracoes.visible = false
	GameState.setValue("podeAndar", true) # Habilita o movimento e prende o mouse


func _on_configuracoes_pressed() -> void:
	container_configuracoes.visible = !container_configuracoes.visible

func _on_voltar_pressed() -> void:
	visible = false
	TransicaoCenas.change_scene("res://scenes/MenuInicial.tscn")


func _on_volume_value_changed(value: float) -> void:
	print("Volume alterado")
	
	var linear = value / 100 # 0 a 1, crudemente a porcentagem
	
	Settings.set_volume_geral(linear)
	label_volume_geral.text = str(int(value)) + "%"


func _on_volume_musica_changed(value: float) -> void:
	var linear = value / 100 # 0 a 1, crudemente a porcentagem
	
	Settings.set_volume_musica(linear)
	label_volume_musica.text = str(int(value)) + "%"


func _on_sensibilidade_changed(value: float) -> void:
	Settings.set_sensibilidade(value)
	label_sensibilidade.text = str(int(value * 100)) + "%"
	if(value == 0.25):
		label_sensibilidade.text += " (Padrão)"


func _on_check_button_tela_cheia_toggled(toggled_on: bool) -> void:
	match toggled_on:
		true:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		false:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
