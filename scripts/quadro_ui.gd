extends Control

@onready var codigo = $PanelContainer/MarginContainer/HBoxContainer/TextureRect/TextureRect4/VBoxContainer/LineEdit


func _ready() -> void:
	GameState.setValue("podeAndar", false)


func _on_button_pressed() -> void:
	if(codigo.text.to_upper() == "VERMELHO EM GREENVILLE"):
		print("Codigo certo!!!")
		GameState.setValue("podeAndar", true)
		TransicaoCenas.change_scene("res://scenes/fimDemo.tscn")
		
	elif(codigo.text.to_upper() == "LABUBU"):
		print("Morango do amor. Hmmmm...")
		
	else:
		print("Codigo errado, tente novamente...")


func _on_line_edit_text_submitted(_new_text: String) -> void:
	_on_button_pressed()
