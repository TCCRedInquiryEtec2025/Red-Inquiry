extends Control

@onready var trovao = $Fundo/SubViewport/FundoMenu/Trovao

@onready var slider_geral = $MenuOpcoes/CenterContainer/StylePanel/MarginContainer/Layout/Configuracoes/Sliders_porcentagens/Sliders/VolumeGeral/HSlider
@onready var slider_musica = $MenuOpcoes/CenterContainer/StylePanel/MarginContainer/Layout/Configuracoes/Sliders_porcentagens/Sliders/VolumeMusica/HSlider
@onready var slider_sensibilidade = $MenuOpcoes/CenterContainer/StylePanel/MarginContainer/Layout/Configuracoes/Sliders_porcentagens/Sliders/Sensibilidade/HSlider

@onready var label_geral = $MenuOpcoes/CenterContainer/StylePanel/MarginContainer/Layout/Configuracoes/Sliders_porcentagens/Porcentagens/LabelVolumeGeral
@onready var label_musica = $MenuOpcoes/CenterContainer/StylePanel/MarginContainer/Layout/Configuracoes/Sliders_porcentagens/Porcentagens/labelVolumeMusica
@onready var label_sensibilidade = $MenuOpcoes/CenterContainer/StylePanel/MarginContainer/Layout/Configuracoes/Sliders_porcentagens/Porcentagens/LabelSensibilidade

func _ready() -> void:	
	$Chuva.play()

	GameState.setValue("podeAndar", false)
	trovao.connect("trovao_acionado", Callable(self, "_on_thunder_triggered"))
	
	$MenuPrincipal/ConfirmaSair.visible = false

func _on_thunder_triggered():
	$Trovao.play()


func _on_sair_pressed() -> void:
	$MenuPrincipal/ConfirmaSair.visible = true


func _on_iniciar_pressed() -> void:
	TransicaoCenas.change_scene("res://scenes/loading_screen.tscn")


func _on_opcoes_pressed() -> void:
	$MenuPrincipal.visible = false
	$MenuOpcoes.visible = true


func _on_voltar_opcoes_pressed() -> void:
	$MenuPrincipal.visible = true
	$MenuOpcoes.visible = false


func _on_creditos_pressed() -> void:
	$MenuPrincipal.visible = false
	$MenuCreditos.visible = true


func _on_voltar_creditos_pressed() -> void:
	$MenuPrincipal.visible = true
	$MenuCreditos.visible = false


func _on_check_button_tela_cheia_toggled(toggled_on: bool) -> void:
	match toggled_on:
		true:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		false:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)


func _on_sair_sim_pressed() -> void:
	get_tree().quit()


func _on_sair_nao_pressed() -> void:
	$MenuPrincipal/ConfirmaSair.visible = false


func _on_slider_volume_geral_value_changed(value: float) -> void:
	var linear = value / 100 # 0 a 1, crudemente a porcentagem
	
	Settings.set_volume_geral(linear)
	label_geral.text = str(int(value)) + "%"


func _on_slider_volume_musica_value_changed(value: float) -> void:
	var linear = value / 100 # 0 a 1, crudemente a porcentagem
	
	Settings.set_volume_musica(linear)
	label_musica.text = str(int(value)) + "%"


func _on_slider_sensibilidade_value_changed(value: float) -> void:
	Settings.set_sensibilidade(value)
	label_sensibilidade.text = str(int(value * 100)) + "%"
	if(value == 0.25):
		label_sensibilidade.text += " (Padrão)"
	

func _on_menu_opcoes_visibility_changed() -> void:
	if($MenuOpcoes.visible == true):
		# Iniciando os sliders
		slider_geral.value = int(Settings.volume_geral * 100)
		slider_musica.value = int(Settings.volume_musica * 100)
		slider_sensibilidade.value = Settings.sensibilidade
		
