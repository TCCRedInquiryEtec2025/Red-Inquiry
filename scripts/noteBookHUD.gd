extends CanvasLayer

@export var player: CharacterBody3D

func _ready() -> void:
	set_process_input(true) # Recebe inputs mesmo invisível
	visible = false

func _input(event):
	if event.is_action_pressed("agenda"):
		if(player.is_on_floor() and !GameState.getValue("pauseAberto") and !GameState.getValue("lendo")):
			toggle_agenda()
			

func toggle_agenda():
	visible = !visible
	
	GameState.setValue("podeAndar", !visible)
	GameState.setValue("abrindoAgenda", visible)
