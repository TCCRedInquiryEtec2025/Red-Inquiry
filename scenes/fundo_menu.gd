extends Node3D

func _ready() -> void:
	$Ventilador/AnimationPlayer.play("ventila")
	$ParticulasChuva.emitting = true
