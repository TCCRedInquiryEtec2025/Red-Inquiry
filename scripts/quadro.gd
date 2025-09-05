extends Interactable

func _process(_delta: float) -> void:
	pass
	
func _on_interacted(_body: Variant) -> void:
	if !GameState.getValue("cartaTerence") or !GameState.getValue("folhaArrancada"):
		response_prompt = "Eu ainda preciso de mais informações..."
		
	elif GameState.getValue("cartaTerence") and GameState.getValue("folhaArrancada"):
		GameState.setValue("podeAndar", false)
		get_tree().change_scene_to_file("res://scenes/quadroUI.tscn")
