extends ColorRect

func _ready():
	var shader = load("res://assets/shaders/vignette.gdshader")
	var mat = ShaderMaterial.new()
	mat.shader = shader
	self.material = mat

	# Faz o ColorRect ocupar a tela toda
	anchor_left = 0
	anchor_top = 0
	anchor_right = 1
	anchor_bottom = 1

	offset_left = 0
	offset_top = 0
	offset_right = 0
	offset_bottom = 0

	mouse_filter = MOUSE_FILTER_IGNORE
