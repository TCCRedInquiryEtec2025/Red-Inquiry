extends CanvasLayer

@export var player = null

func _input(event):
	if event.is_action_pressed("ui_tab"):
		if(player.is_on_floor()):
			toggle_agenda()

func toggle_agenda():
	self.visible = !self.visible
	
	GameState.setValue("podeAndar", !GameState.getValue("podeAndar"))
	GameState.setValue("abrindoAgenda", self.visible)
