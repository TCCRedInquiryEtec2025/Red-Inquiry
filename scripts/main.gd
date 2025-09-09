extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$NoteBookHUD.player = $Player
	
	$ParticulasChuva.emitting = true

	$Ventilador/AnimationPlayer.play("ventila")
	
	GameState.setValue("podeAndar", true)
	
func _init() -> void:
	if(GameState.getValue("usarCoordenadas")):
		if(get_tree().current_scene.name in GameState.player_positions):
			$Player.position = GameState.player_positions[get_tree().current_scene.name]
			GameState.setValue("usarCoordenadas", false)
