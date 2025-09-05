extends Control

@onready var codigo = $PanelContainer/MarginContainer/HBoxContainer/VBoxContainer/LineEdit

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE


func _on_button_pressed() -> void:
	if(codigo.text.to_upper() == "VERMELHO EM GREENVILLE"):
		print("Codigo certo!!!")
		GameState.setValue("podeAndar", true)
		get_tree().change_scene_to_file("res://scenes/world.tscn")
		
	elif(codigo.text.to_upper() == "LABUBU"):
		print("Morango do amor. Hmmmm...")
		
	else:
		print("Codigo errado, tente novamente...")


func _on_line_edit_text_submitted(_new_text: String) -> void:
	_on_button_pressed()
