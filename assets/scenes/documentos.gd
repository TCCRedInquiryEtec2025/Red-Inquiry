extends CenterContainer

@onready var carta = $Carta

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if(GameState.getValue("lendoCarta")): # Caso a carta tenha que estar na tela
		carta.visible = true
		
		if(Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) or Input.is_action_pressed("ui_cancel")):
			GameState.setValue("lendoCarta", false)
			GameState.setValue("podeAndar", true)
	
	else:
		carta.visible = false
