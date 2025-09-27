extends Interactable

@onready var animation = $AnimationPlayer
var opened = false

func _on_interacted(_body: Variant) -> void:
	print("Tentando rodar animação...")
	if($AudioStreamPlayer3D.playing):
		$AudioStreamPlayer3D.stop()
	
	if opened:
		animation.play_backwards("toggle")
	else:
		animation.play("toggle")
	
	$AudioStreamPlayer3D.play()
	opened = !opened

func _process(_delta):
	if(opened):
		prompt_message = "Fechar"
		
	else:
		prompt_message = "Abrir"
