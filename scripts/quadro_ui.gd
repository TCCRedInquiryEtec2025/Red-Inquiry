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
		TransicaoCenas.change_scene("res://scenes/fimDemo.tscn")
		
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
