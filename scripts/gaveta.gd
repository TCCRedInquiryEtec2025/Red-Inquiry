extends Interactable

@onready var animation = $AnimationPlayer
var opened = false

func _on_interacted(body: Variant) -> void:
	print("Tentando rodar animação...")
	if opened:
		animation.play_backwards("openClose")
	else:
		animation.play("openClose")
	opened = !opened

func _process(_delta):
	if(opened):
		prompt_message = "Fechar"
	else:
		prompt_message = "Abrir"
