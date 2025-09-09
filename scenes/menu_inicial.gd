extends Control

func _ready() -> void:
	var fundo = load("res://scenes/fundoMenu.tscn").instantiate()
	$SubViewportContainer/SubViewport.add_child(fundo)
	
	$AudioStreamPlayer.play()

	GameState.setValue("podeAndar", false)


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/world.tscn")
