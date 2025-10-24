extends Interactable

@export var fala: AudioStreamMP3

func _process(_delta: float) -> void:
	pass
	
func _on_interacted(_body: Variant) -> void:
	if !GameState.getValue("cartaTerence") or !GameState.getValue("folhaArrancada"):
		response_prompt = "Eu ainda preciso de mais informações..."
		
	elif GameState.getValue("cartaTerence") and GameState.getValue("folhaArrancada"):
		GameState.setValue("podeAndar", false)
	
		TransicaoCenas.change_scene("res://scenes/quadroUI.tscn")
