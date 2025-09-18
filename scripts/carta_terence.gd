extends Carta


func _on_interacted(_body: Variant) -> void:
	GameState.setValue("cartaTerence", !GameState.getValue("cartaTerence"))
	queue_free()


func _ready() -> void:
	texto = "“Yhuphokr hp Juhhqylooh”\n\n“A -> D”\n“A <- D”"
