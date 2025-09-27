extends CanvasLayer

@onready var container_opcoes = $"Pause/PanelContainer/Divisão/MenuLateral/Opcoes"
@onready var container_configuracoes = $"Pause/PanelContainer/Divisão/CantoDireito"

@onready var slider_volume_geral = $"Pause/PanelContainer/Divisão/CantoDireito/PanelContainer/MarginContainer/Configuracoes/Sliders_porcentagens/Sliders/VolumeGeral"
@onready var slider_volume_musica = $"Pause/PanelContainer/Divisão/CantoDireito/PanelContainer/MarginContainer/Configuracoes/Sliders_porcentagens/Sliders/VolumeMusica"
@onready var slider_sensibilidade = $"Pause/PanelContainer/Divisão/CantoDireito/PanelContainer/MarginContainer/Configuracoes/Sliders_porcentagens/Sliders/Sensibilidade"
@onready var checkBox_tela_cheia = $"Pause/PanelContainer/Divisão/CantoDireito/PanelContainer/MarginContainer/Configuracoes/TelaCheia/CheckButtonTelaCheia"

func _ready() -> void:
	pass


func _on_visibility_changed() -> void:
	if(visible == true):
		# Iniciando os sliders
		slider_volume_geral.value = int(Settings.volume_geral * 100)
		slider_volume_musica.value = int(Settings.volume_musica * 100)
		slider_sensibilidade.value = Settings.sensibilidade
		# Ajusta a opção de tela cheia bonitinho
		checkBox_tela_cheia.button_pressed = DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN
