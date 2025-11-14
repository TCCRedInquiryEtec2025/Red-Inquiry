extends Node3D

@onready var fotoNina = $MesaDois/RetratoMesa/Foto
@onready var fotoMario = $Comoda/RetratoMesa/Foto

@onready var objetivosUI = $ControlObjetivos
@onready var label_objetivo = $ControlObjetivos/PainelObjetivos/VBoxContainer/LabelObjetivo


func _ready() -> void:		
	var tween: Tween
	objetivosUI.visible = false
	objetivosUI.modulate.a = 0
	label_objetivo.text = "- Ache as cartas necessárias\n(consulte a agenda pressionando [TAB])"
	
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
	
	await get_tree().create_timer(6).timeout
	
	objetivosUI.visible = true
	$ControlObjetivos/AudioEscrevendo.play()
	tween = create_tween()
	await tween.tween_property(objetivosUI, "modulate:a", 1, 0.4).finished
	
	await get_tree().create_timer(7).timeout
	
	$ControlObjetivos/AudioRasgando.play()
	tween = create_tween()
	await tween.tween_property(objetivosUI, "modulate:a", 0, 0.35).finished
	objetivosUI.visible = false
	
	# Espera as cartas necessárias
	await esperar_cartas()
			
	label_objetivo.text = "- Resolva o mistério no quadro"
		
	await get_tree().create_timer(1).timeout
		
	objetivosUI.visible = true
	$ControlObjetivos/AudioEscrevendo.play()
	tween = create_tween()
	await tween.tween_property(objetivosUI, "modulate:a", 1, 0.4).finished
	
	await get_tree().create_timer(7).timeout
	
	$ControlObjetivos/AudioRasgando.play()
	tween = create_tween()
	await tween.tween_property(objetivosUI, "modulate:a", 0, 0.35).finished
	objetivosUI.visible = false


func esperar_cartas() -> void:
	var cartas_necessarias = ["cartaTerence", "folhaArrancada"]
	
	for carta in cartas_necessarias:
		if(!GameState.getValue(carta)):
			while(!GameState.getValue(carta)):
				var nome = await GameState.carta_obtida
				if(nome == carta):
					break
