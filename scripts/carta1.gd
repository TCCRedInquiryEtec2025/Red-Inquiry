extends Interactable


func _on_interacted(_body: Variant) -> void:
	GameState.setValue("Carta1", !GameState.getValue("Carta1"))
	queue_free()
