extends RayCast3D

@onready var prompt = $Prompt
@onready var response = $ResponseLabel

func _show_response(text: String) -> void:
	var label = $ResponseLabel
	
	if(text.is_empty() or text == ""):
		print("Interagível sem mensagem")
		return
	
	while GameState.getValue("lendo"):
		await get_tree().process_frame # próximo frame
	
	label.text = text
	label.modulate.a = 0
		
	var tween = create_tween() # Fade-in
	tween.tween_property(label, "modulate:a", 1, 0.5)
	await tween.finished
		
	var lines = label.get_line_count()
	var time = 1.5 + (lines * 2)
	await get_tree().create_timer(time).timeout # Tempo que a mensagem fica na tela
		
	tween = create_tween() # Fade-out
	tween.tween_property(label, "modulate:a", 0, 0.8)
	await tween.finished

func _ready() -> void:
	response.text = ''


func _physics_process(_delta: float) -> void:
	prompt.text = ''
	
	if(GameState.getValue("lendo")):
		return
	
	if(is_colliding()):
		var collider = get_collider()
		
		if(collider is Interactable):
			prompt.text = collider.get_prompt()
			
			if Input.is_action_just_pressed("interact"):
				_interact_with(collider)


func _interact_with(collider: Interactable) -> void:
	collider.interact(owner)
	
	if(collider.get_class() == "Carta"):
		
		GameState.setValue("lendo", true)
		GameState.setValue("podeAndar", false)
		
	_show_response(collider.response_prompt)
