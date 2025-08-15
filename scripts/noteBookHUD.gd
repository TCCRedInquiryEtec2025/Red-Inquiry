extends CanvasLayer

@export var player = null
@onready var hud = self

var is_on = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _input(event):
	if event.is_action_pressed("ui_tab"):
		if(player.is_on_floor()):
			toggle_agenda()

func toggle_agenda():
	hud.visible = !hud.visible
	is_on = !is_on
	player.can_move = !is_on
	if(is_on):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	else:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	print(is_on)
