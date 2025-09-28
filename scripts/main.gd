extends Node3D

@onready var fotoNina = $MesaDois/RetratoMesa/Foto
@onready var fotoMario = $Comoda/RetratoMesa/Foto

# Called when the node enters the scene tree for the first time.
func _ready() -> void:	
	GameState.setValue("cartaTerence", false)
	GameState.setValue("folhaArrancada", false)
	GameState.setValue("cartaJoanne", false)
	GameState.setValue("jornal", false)
	GameState.setValue("arquivo", false)
	
	$ParticulasChuva.emitting = true

	$Ventilador/AnimationPlayer.play("ventila")
	
	GameState.setValue("podeAndar", true)
	
	var matNina = StandardMaterial3D.new()
	matNina.albedo_texture = load("res://assets/textures/Imagem do WhatsApp de 2025-04-15 à(s) 18.52.30_663286ec.jpg")
	matNina.uv1_scale = Vector3(3.2, 2.1, 1)
	matNina.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	fotoNina.set_surface_override_material(0, matNina)
		
	var matMario = StandardMaterial3D.new()
	matMario.albedo_texture = load("res://assets/mario.jpg")
	matMario.uv1_scale = Vector3(3.1, 2.1, 1)
	matMario.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	fotoMario.set_surface_override_material(0, matMario)
