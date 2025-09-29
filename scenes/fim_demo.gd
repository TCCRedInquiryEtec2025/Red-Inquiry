extends Control

func _ready() -> void:
	GameState.setValue("podeAndar", false)


func _on_close_pressed() -> void:
	TransicaoCenas.change_scene("res://scenes/menuInicial.tscn")
