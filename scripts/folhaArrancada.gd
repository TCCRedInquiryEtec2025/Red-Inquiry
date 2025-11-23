extends Carta

@export var falaReserva = AudioStreamMP3

@onready var carta_mesh = $MeshInstance3D
@onready var area = $GlowArea

var brilho_material: ShaderMaterial


func _on_interacted(_body: Variant) -> void:
	if GameState.getValue("pauseAberto") or GameState.getValue("abrindoAgenda"): return
	GameState.setValue("folhaArrancada", !GameState.getValue("folhaArrancada"))
	
	if(GameState.getValue("cartaTerence")):
		response_prompt = "Me lembrei! Eu tinha achado isso antes de apagar. Tenho certeza que é a solução para decodificar a mensagem cifrada da carta. Vou fazer no meu quadro…"
	
	else:
		response_prompt = "Me lembrei! Eu tinha achado isso antes de apagar. Tenho certeza que é a solução para decodificar a mensagem cifrada da carta. Vou fazer no meu quadro, mas preciso achar a carta com o código antes…"
	queue_free()
	
	
func _ready() -> void:
	texto = "Se ele tinha qualquer coisa confidencial a dizer, ele escrevia cifrado, isto é, mudando a ordem das letras do alfabeto, para que nenhuma palavra pudesse ser compreendida. Se alguém deseja decifrar a mensagem e entender seu significado, deve substituir a quarta letra do alfabeto, a saber 'D', por 'A', e assim por diante com as outras…"
	
	brilho_material = ShaderMaterial.new()
	brilho_material.shader = preload("res://assets/shaders/aura_carta.gdshader")
	brilho_material.set_shader_parameter("size", 1.1)


func _on_area_body_entered(body: Node3D) -> void:
	if(body is CharacterBody3D):
		carta_mesh.mesh.material.next_pass = brilho_material
		print(">> Brilho ativado: ", name)


func _on_area_body_exited(body: Node3D) -> void:
	if(body is CharacterBody3D):
		carta_mesh.mesh.material.next_pass = null
		print(">> Brilho desativado: ", name)
