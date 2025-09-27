extends Interactable

@onready var animation = $AnimationPlayer
@onready var collision = $CollisionShape3D
var opened = false

func _on_interacted(_body: Variant) -> void:
	print("Tentando rodar animação...")
	if opened:
		animation.play_backwards("on_off")
		$Close.play()
		
		if($Open.playing):
			$Open.stop()
	else:
		animation.play("on_off")
		$Open.play(0.4)
		
		if($Close.playing):
			$Close.stop()
	opened = !opened

func _process(_delta):
	if(opened):
		prompt_message = "Fechar"
	else:
		prompt_message = "Abrir"
	

func _on_animation_finished(_anim_name: StringName) -> void:
	$Close.stop()
	$Open.stop()
