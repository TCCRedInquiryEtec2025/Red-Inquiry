extends Control

@onready var trovao = $SubViewportContainer/SubViewport/FundoMenu/Trovao

func _ready() -> void:
	$Chuva.play()

	GameState.setValue("podeAndar", false)
	
	trovao.connect("trovao_acionado", Callable(self, "_on_thunder_triggered"))


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/world.tscn")


func _on_thunder_triggered():
	$Trovao.play()
