extends Interactable


func _on_interacted(_body: Variant) -> void:
	GameState.setValue("jornal", !GameState.getValue("jornal"))
	queue_free()
