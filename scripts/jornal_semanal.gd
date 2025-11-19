extends Carta

@onready var carta_mesh = $MeshInstance3D
@onready var area = $GlowArea

var brilho_material: ShaderMaterial


func _on_interacted(_body: Variant) -> void:
	if GameState.getValue("pauseAberto") or GameState.getValue("abrindoAgenda"): return
	GameState.setValue("jornal", !GameState.getValue("jornal"))
	queue_free()


func _ready() -> void:
	texto = "“INFORMANTE MORTO A TIROS EM FRENTE A DELEGACIA:
		Após tragédia em centro comercial Nova Iorquino e apreensão de aproximadamente três toneladas de entorpecentes na semana passada, suspeito encontrado no local, identificado como Erick Nixon, admitiu vínculo com a Máfia Italiana.\nO criminoso, além de citar local de origem e destino das mercadorias contrabandeadas, prometeu revelar nomes com a devida realização de um acordo cujas cláusulas desconhecemos.\nAo ser transferido para outra delegacia no centro de Nova Iorque para a realização do acordo que lhe fora prometido, um carro não identificado passou em alta velocidade, alvejando o criminoso e outros quatro policiais presentes. Testemunhas dizem que tudo foi rápido demais para que conseguissem citar detalhes.\nO criminoso não resistiu aos ferimentos e faleceu no local, enquanto os policiais baleados estão todos em estado crítico no Hospital Mount Sinai.”"
	
	brilho_material = ShaderMaterial.new()
	brilho_material.shader = preload("res://assets/shaders/aura_carta.gdshader")
	brilho_material.set_shader_parameter("color", Color("#e61a1a"))
	brilho_material.set_shader_parameter("size", 1.1)


func _on_area_body_entered(body: Node3D) -> void:
	if(body is CharacterBody3D):
		carta_mesh.mesh.material.next_pass = brilho_material
		print(">> Brilho ativado: ", name)


func _on_area_body_exited(body: Node3D) -> void:
	if(body is CharacterBody3D):
		carta_mesh.mesh.material.next_pass = null
		print(">> Brilho desativado: ", name)
