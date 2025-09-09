extends Control

func _ready() -> void:
	GameState.setValue("podeAndar", false)


func _on_close_pressed() -> void:
	get_tree().quit()
