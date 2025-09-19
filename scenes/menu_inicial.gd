extends Control

@onready var trovao = $SubViewportContainer/SubViewport/FundoMenu/Trovao

func _ready() -> void:
	$Chuva.play()

	GameState.setValue("podeAndar", false)
	
	trovao.connect("trovao_acionado", Callable(self, "_on_thunder_triggered"))


func _on_button_pressed() -> void:
	TransicaoCenas.change_scene("res://scenes/loading_screen.tscn")


func _on_thunder_triggered():
	$Trovao.play()
