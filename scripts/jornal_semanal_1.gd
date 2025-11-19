extends Carta

@onready var carta_mesh = $MeshInstance3D
@onready var area = $GlowArea

var brilho_material: ShaderMaterial


func _on_interacted(_body: Variant) -> void:
	if GameState.getValue("pauseAberto") or GameState.getValue("abrindoAgenda"): return
	GameState.setValue("jornal1", !GameState.getValue("jornal1"))
	queue_free()


func _ready() -> void:
	texto = "“CONTRABANDO ANIMAL SE TORNA PREOCUPAÇÃO MUNDIAL
			Após relatório feito pelo OPFF(Órgão Protetor da Fauna e Flora), registrou-se a diminuição de aproximadamente 73% nos animais vertebrados. Dentro do senso, observa-se como as principais afetadas são a fauna latino-americana, africana e da Ásia-Pacífico.\nSomente na África, foi contabilizada a caça ilegal de aproximadamente 1.600 elefantes no último mês, espécie que se tornou alvo para a utilização do marfim de seus chifres.\nNo Brasil, aproximadamente 38 milhões de animais são retirados anualmente da natureza, com apenas 0,45% dos casos sendo apreendidos pelas autoridades.\nInvestiga-se a atuação das mais variadas máfias do mundo no contrabando de animais. As atenções se voltaram para o assunto desde a recente apreensão de 23 espécies em um depósito de Gizé, no Egito, onde uma organização, até então desconhecida, atuava no contrabando constante de espécies africanas para a América…”"
	
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
