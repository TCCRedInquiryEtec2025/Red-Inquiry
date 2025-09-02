extends Interactable


func _on_interacted(_body: Variant) -> void:
	GameState.setValue("cartaTerence", !GameState.getValue("cartaTerence"))
	queue_free()
