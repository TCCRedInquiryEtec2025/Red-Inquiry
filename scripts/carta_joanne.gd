extends Interactable


func _on_interacted(_body: Variant) -> void:
	GameState.setValue("cartaJoanne", !GameState.getValue("cartaJoanne"))
	queue_free()
