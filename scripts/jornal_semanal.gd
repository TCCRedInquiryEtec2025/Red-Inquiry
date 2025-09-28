extends Carta


func _on_interacted(_body: Variant) -> void:
	GameState.setValue("jornal", !GameState.getValue("jornal"))
	queue_free()


func _ready() -> void:
	texto = "“INFORMANTE MORTO A TIROS EM FRENTE A DELEGACIA:
	Após tragédia em centro comercial Nova Iorquino e apreensão de aproximadamente três toneladas de entorpecentes na semana passada, suspeito encontrado no local, identificado como Erick Nixon, admitiu vínculo com a Máfia Italiana.\nO criminoso, além de citar local de origem e destino das mercadorias contrabandeadas, prometeu revelar nomes com a devida realização de um acordo cujas cláusulas desconhecemos.\nAo ser transferido para outra delegacia no centro de Nova Iorque para a realização do acordo que lhe fora prometido, um carro não identificado passou em alta velocidade, alvejando o criminoso e outros quatro policiais presentes. Testemunhas dizem que tudo foi rápido demais para que conseguissem citar detalhes.\nO criminoso não resistiu aos ferimentos e faleceu no local, enquanto os policiais baleados estão todos em estado crítico no Hospital Mount Sinai.”"
	
