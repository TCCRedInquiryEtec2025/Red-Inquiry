extends Carta

@onready var carta_mesh = $MeshInstance3D
@onready var area = $GlowArea

var brilho_material: ShaderMaterial


func _on_interacted(_body: Variant) -> void:
	if GameState.getValue("pauseAberto") or GameState.getValue("abrindoAgenda"): return
	GameState.setValue("cartaTerence", !GameState.getValue("cartaTerence"))
	queue_free()


func _ready() -> void:
	texto = "“Yhuphokr hp Juhhqylooh”\n\n“A -> D”\n“A <- D”"
	
	brilho_material = ShaderMaterial.new()
	brilho_material.shader = preload("res://assets/shaders/aura_carta.gdshader")
	brilho_material.set_shader_parameter("size", 1.1)


func _on_area_body_entered(body: Node3D) -> void:
	if(body is CharacterBody3D):
		carta_mesh.mesh.material.next_pass = brilho_material
		print(">> Brilho ativado: ", name)


func _on_area_body_exited(body: Node3D) -> void:
	if(body is CharacterBody3D):
		carta_mesh.mesh.material.next_pass = null
		print(">> Brilho desativado: ", name)
