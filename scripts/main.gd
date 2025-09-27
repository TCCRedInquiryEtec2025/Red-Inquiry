extends Node3D

@onready var fotoNina = $MesaDois/RetratoMesa/Foto

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$ParticulasChuva.emitting = true

	$Ventilador/AnimationPlayer.play("ventila")
	
	GameState.setValue("podeAndar", true)
	
	var matNina = fotoNina.mesh.surface_get_material(0)
	if(matNina is StandardMaterial3D):
		matNina.albedo_texture = load("res://assets/textures/Imagem do WhatsApp de 2025-04-15 à(s) 18.52.30_663286ec.jpg")
		matNina.uv1_scale = Vector3(3.2, 2.1, 1.0)
