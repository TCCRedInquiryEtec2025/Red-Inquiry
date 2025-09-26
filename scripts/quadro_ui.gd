extends Control

@onready var codigo = $PanelContainer/TextureRect/MarginContainer/TextureRect4/VBoxContainer/VBoxFrase
@onready var LabelResposta = $PanelContainer/TextureRect/MarginContainer/TextureRect4/ResponseLabel


func _ready() -> void:
	GameState.setValue("podeAndar", false)
	
	LabelResposta.visible = false
	LabelResposta.modulate.a = 0


func _on_button_pressed() -> void:
	if(codigo.check_phrase() == true):
		GameState.setValue("podeAndar", true)
		TransicaoCenas.change_scene("res://scenes/menuInicial.tscn")
		
	else:
		LabelResposta.visible = true
		
		var falaTween = create_tween()
		falaTween.tween_property(LabelResposta, "modulate:a", 1, 1)
		await falaTween.finished
		
		await get_tree().create_timer(3).timeout
		
		falaTween = create_tween()
		falaTween.tween_property(LabelResposta, "modulate:a", 0, 1)
		await falaTween.finished
		
		LabelResposta.visible = false
