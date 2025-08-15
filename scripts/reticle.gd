extends CenterContainer

@export var DOT_RADIUS:float = 1.0
@export var DOT_COLOR:Color = Color.WHITE


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	queue_redraw()


func _draw():
	draw_circle(Vector2(0,0), DOT_RADIUS, DOT_COLOR)
	draw_circle(Vector2(0,0), DOT_RADIUS + 1, Color.BLACK, false, 3)
