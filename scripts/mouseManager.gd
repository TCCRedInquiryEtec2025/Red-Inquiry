extends Node
	
func _process(delta: float) -> void:
	if(GameState.getValue("lendoCarta")):
		set_mouse_confined()
		
	if(!GameState.getValue("podeAndar")):
		set_mouse_visible()
		
	else:
		set_mouse_captured()
		
	
func set_mouse_confined() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CONFINED
	
func set_mouse_captured() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	

func set_mouse_visible() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
