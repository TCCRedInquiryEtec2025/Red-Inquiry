extends CanvasLayer

@export var player: CharacterBody3D

func _ready() -> void:
	visible = false

func _input(event):
	if event.is_action_pressed("ui_tab"):
		if(player.is_on_floor() and !GameState.getValue("pauseAberto")):
			toggle_agenda()

func toggle_agenda():
	visible = !visible
	
	GameState.setValue("podeAndar", !visible)
	GameState.setValue("abrindoAgenda", visible)
