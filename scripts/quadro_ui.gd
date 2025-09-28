extends Control

@onready var codigo = $PanelContainer/MarginContainer/HBoxContainer/VBoxContainer/LineEdit

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE


func _on_button_pressed() -> void:
	if(codigo.text.to_upper() == "VERMELHO EM GREENVILLE"):
		print("Codigo certo!!!")
		get_tree().change_scene_to_file("res://scenes/world.tscn")
		
	elif(codigo.text.to_upper() == "LABUBU"):
		print("Morango do amor. Hmmmm...")
		
	else:
<<<<<<< Updated upstream
		print("Codigo errado, tente novamente...")


func _on_line_edit_text_submitted(_new_text: String) -> void:
	_on_button_pressed()
=======
		LabelResposta.visible = true
		
		var falaTween = create_tween()
		falaTween.tween_property(LabelResposta, "modulate:a", 1, 1)
		await falaTween.finished
		
		await get_tree().create_timer(3).timeout
		
		falaTween = create_tween()
		falaTween.tween_property(LabelResposta, "modulate:a", 0, 1)
		await falaTween.finished
		
		LabelResposta.visible = false


func _on_button_reiniciar_pressed() -> void:
	var resposta_cifrada = ["YHUPHOKR", "HP", "JUHHQYLOOH"]
	
	for i in range($PanelContainer/TextureRect/MarginContainer/TextureRect4/VBoxContainer/VBoxFrase.get_child_count()):
		var linha = $PanelContainer/TextureRect/MarginContainer/TextureRect4/VBoxContainer/VBoxFrase.get_child(i - 1)
		var palavra_alvo = resposta_cifrada[i -1]
		var letras_palavra = palavra_alvo.split("")
		
		for j in range(min(linha.get_child_count(), letras_palavra.size())):
			var letra_vbox = linha.get_child(j)
			var label = letra_vbox.get_node("Label")
			label.text = palavra_alvo[j]
			
			# Atualizando também o índice no script
			letra_vbox.index = letra_vbox.letras.find(label.text)
<<<<<<< Updated upstream
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
