extends Item

func _on_interacted(_interactable: Variant) -> void:
	GameState.setValue("flashlight", true)
	queue_free()
