extends Carta


func _on_interacted(_body: Variant) -> void:
	GameState.setValue("folhaArrancada", !GameState.getValue("folhaArrancada"))
	
	if(GameState.getValue("cartaTerence")):
		response_prompt = "Me lembrei! Eu tinha achado isso antes de apagar. Tenho certeza que é a solução para decodificar a mensagem cifrada da carta. Vou fazer no meu quadro…"
	
	else:
		response_prompt = "Me lembrei! Eu tinha achado isso antes de apagar. Tenho certeza que é a solução para decodificar a mensagem cifrada da carta. Vou fazer no meu quadro, mas preciso achar a carta com o código antes…"
	queue_free()
	
	
func _ready() -> void:
	texto = "Se ele tinha qualquer coisa confidencial a dizer, ele escrevia cifrado, isto é, mudando a ordem das letras do alfabeto, para que nenhuma palavra pudesse ser compreendida. Se alguém deseja decifrar a mensagem e entender seu significado, deve substituir a quarta letra do alfabeto, a saber 'D', por 'A', e assim por diante com as outras…"
