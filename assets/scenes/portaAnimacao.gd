extends Interactable

@onready var animation = $AnimationPlayer
@onready var collision = $CollisionShape3D
var opened = false

func _on_interacted(_body: Variant) -> void:
	print("Tentando rodar animação...")
	if opened:
		animation.play_backwards("on_off")
	else:
		animation.play("on_off")
	opened = !opened

func _process(delta):
	if(opened):
		prompt_message = "Fechar"
	else:
		prompt_message = "Abrir"
