extends Carta

@onready var carta_mesh = $MeshInstance3D
@onready var area = $GlowArea

var brilho_material: ShaderMaterial


func _on_interacted(_body: Variant) -> void:
	if GameState.getValue("pauseAberto") or GameState.getValue("abrindoAgenda"): return
	GameState.setValue("cartaJoanne", !GameState.getValue("cartaJoanne"))
	queue_free()


func _ready() -> void:
	texto = "Caro Sr. Connor, Após nossa conversa na última sexta, acreditei que seria melhor que lhe escrevesse essa carta contendo tudo que me lembro em torno do desaparecimento de Terence.\nMeu garoto estava estranho nas semanas anteriores ao sumiço. Falava coisas desconexas, mas jamais as explicava. Sumia por horas andando pela cidade, falava algo de fazer o bem maior quando eu o questionava, mas jamais dizia onde ia. Ele permanecia me evitando ao máximo durante os últimos tempos.\nMe incomoda como posso ajudar tão pouco! No dia que ele desapareceu nada de diferente aconteceu, ele apenas saiu como nos dias anteriores, sem dizer uma única palavra sobre para onde iria e, então, nunca voltou para casa.\nAbsolutamente todos os pertences dele permaneceram no quarto, inclusive o dinheiro que ele guardava, logo, tenho certeza que não foi embora por decisão própria. A carta de Terence que lhe entreguei foi encontrada sob a cômoda do quarto.\nEstou no limite detetive! Sei que não lhe dei muito com o que trabalhar, mas eu te imploro, por favor, ache o meu filho!"
	
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
