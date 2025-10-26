extends AudioStreamPlayer

@export var interact_ray: RayCast3D

func _ready() -> void:
	interact_ray.connect("fala_interacao", Callable(self, "_on_triggered_fala"))
	print(">> Script de falas inicializado")
	
func _on_triggered_fala(trigger: Interactable) -> void:		
	if("fala" not in trigger):
		return
		
	if(trigger.name.to_lower() == "quadro" and GameState.getValue("folhaArrancada") and GameState.getValue("cartaTerence")):
		return
	
	print(">> Trigger de fala acionado")
	stream = null
	stream = trigger.fala
	if("falaReserva" in trigger and !GameState.getValue("cartaTerence")):
		stream = trigger.falaReserva
		
	pitch_scale = 0.92
	volume_db = -10
	
	while GameState.getValue("lendo"): # Esperando sair da UI da carta
		await get_tree().process_frame # próximo frame
		
	play()
