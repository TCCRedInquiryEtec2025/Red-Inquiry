extends Interactable


func _on_interacted(_body: Variant) -> void:
	GameState.setValue("folhaArrancada", !GameState.getValue("folhaArrancada"))
	
	if(GameState.getValue("cartaTerence")):
		response_prompt = "Me lembrei! Eu tinha achado isso antes de apagar. Tenho certeza que é a solução para decodificar a mensagem cifrada da carta. Vou fazer no meu quadro…"
	
	else:
		response_prompt = "Me lembrei! Eu tinha achado isso antes de apagar. Tenho certeza que é a solução para decodificar a mensagem cifrada da carta. Vou fazer no meu quadro, mas preciso achar a carta com o código antes…"
	queue_free()
