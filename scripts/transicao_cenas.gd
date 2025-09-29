extends CanvasLayer

var cena_escritorio: PackedScene

var is_changing: bool = false

func _ready() -> void:
	visible = false

func change_scene(path: String) -> void:
	if(is_changing):
		return
		
	print("Trocando cena para: ", path)
	is_changing = true
	
	visible = true
	$AnimationPlayer.play("dissolve")
	
	await $AnimationPlayer.animation_finished

	if(path):
		get_tree().change_scene_to_file(path)
		$AnimationPlayer.play_backwards("dissolve")
	
		await $AnimationPlayer.animation_finished
		visible = false

	else:
		push_error("Cena não encontrada: ", path)
		return
		
	is_changing = false

func change_scene_to_packed(packedScene: PackedScene) -> void:
	if(is_changing):
		return
	
	print("Trocando cena para: ", packedScene)
	is_changing = true
	
	visible = true
	$AnimationPlayer.play("dissolve")
	
	await $AnimationPlayer.animation_finished

	if(packedScene):
		get_tree().change_scene_to_packed(packedScene)
		$AnimationPlayer.play_backwards("dissolve")
	
		await $AnimationPlayer.animation_finished
		visible = false
	
	else:
		push_error("Cena não encontrada: ", packedScene)
		return

	is_changing = false
	
