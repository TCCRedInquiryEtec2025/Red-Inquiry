extends HBoxContainer

func _ready() -> void:
	visible = false
	
	var flashlight = false
	
	while !flashlight:
		for i in range(60):
			await get_tree().process_frame
			
		if(GameState.getValue("flashlight")):
			flashlight = true
			
	visible = true
