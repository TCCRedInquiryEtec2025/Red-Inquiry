extends Carta


func _on_interacted(_body: Variant) -> void:
	if GameState.getValue("pauseAberto") or GameState.getValue("abrindoAgenda"): return
	GameState.setValue("cartaTerence", !GameState.getValue("cartaTerence"))
	queue_free()


func _ready() -> void:
	texto = "“Yhuphokr hp Juhhqylooh”\n\n“A -> D”\n“A <- D”"
