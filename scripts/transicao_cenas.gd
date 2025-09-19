extends CanvasLayer


func _ready() -> void:
	visible = false

func change_scene(path: String) -> void:
	visible = true
	$AnimationPlayer.play("dissolve")
	
	await $AnimationPlayer.animation_finished

	get_tree().change_scene_to_file(path)
	$AnimationPlayer.play_backwards("dissolve")
	
	await $AnimationPlayer.animation_finished
	visible = false


func change_scene_to_packed(packedScene: PackedScene) -> void:
	visible = true
	$AnimationPlayer.play("dissolve")
	
	await $AnimationPlayer.animation_finished

	get_tree().change_scene_to_packed(packedScene)
	$AnimationPlayer.play_backwards("dissolve")
	
	await $AnimationPlayer.animation_finished
	visible = false
