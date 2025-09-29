extends Control

var cartas_data = {
	"folha_arrancada": {
		"nome": "Folha arrancada",
		"conteudo": "Se ele tinha qualquer coisa confidencial a dizer, ele escrevia cifrado, isto é, mudando a ordem das letras do alfabeto, para que nenhuma palavra pudesse ser compreendida. Se alguém deseja decifrar a mensagem e entender seu significado, deve substituir a quarta letra do alfabeto, a saber 'D', por 'A', e assim por diante com as outras…",
		"foto": preload("res://assets/cartas/folhaArrancada.jpg")
	},
	"carta_terence": {
		"nome": "Carta de Terence",
		"conteudo": "“Yhuphokr hp Juhhqylooh”\n\n“A -> D”\n“A <- D”",
		"foto": preload("res://assets/cartas/Carta_Terence.jpg")
	},
	"carta_joanne": {
		"nome": "Carta de Joanne",
		"conteudo": "Caro Sr. Connor, Após nossa conversa na última sexta, acreditei que seria melhor que lhe escrevesse essa carta contendo tudo que me lembro em torno do desaparecimento de Terence.\nMeu garoto estava estranho nas semanas anteriores ao sumiço. Falava coisas desconexas, mas jamais as explicava. Sumia por horas andando pela cidade, falava algo de fazer o bem maior quando eu o questionava, mas jamais dizia onde ia. Ele permanecia me evitando ao máximo durante os últimos tempos.\nMe incomoda como posso ajudar tão pouco! No dia que ele desapareceu nada de diferente aconteceu, ele apenas saiu como nos dias anteriores, sem dizer uma única palavra sobre para onde iria e, então, nunca voltou para casa.\nAbsolutamente todos os pertences dele permaneceram no quarto, inclusive o dinheiro que ele guardava, logo, tenho certeza que não foi embora por decisão própria. A carta de Terence que lhe entreguei foi encontrada sob a cômoda do quarto.\nEstou no limite detetive! Sei que não lhe dei muito com o que trabalhar, mas eu te imploro, por favor, ache o meu filho!",
		"foto": preload("res://assets/cartas/Carta_Joanne_Rochefart.jpg")
	},
	"jornal_semanal": {
		"nome": "Jornal semanal",
		"conteudo": "“INFORMANTE MORTO A TIROS EM FRENTE A DELEGACIA:
	Após tragédia em centro comercial Nova Iorquino e apreensão de aproximadamente três toneladas de entorpecentes na semana passada, suspeito encontrado no local, identificado como Erick Nixon, admitiu vínculo com a Máfia Italiana.\nO criminoso, além de citar local de origem e destino das mercadorias contrabandeadas, prometeu revelar nomes com a devida realização de um acordo cujas cláusulas desconhecemos.\nAo ser transferido para outra delegacia no centro de Nova Iorque para a realização do acordo que lhe fora prometido, um carro não identificado passou em alta velocidade, alvejando o criminoso e outros quatro policiais presentes. Testemunhas dizem que tudo foi rápido demais para que conseguissem citar detalhes.\nO criminoso não resistiu aos ferimentos e faleceu no local, enquanto os policiais baleados estão todos em estado crítico no Hospital Mount Sinai.”",
		"foto": preload("res://assets/cartas/Jornal.png")
	},
	"arquivo": {
		"nome": "Arquivo do mafioso",
		"conteudo": "William Goldberg, notório mafioso com operações em Modest Valley. A extensão de suas operações é desconhecida, mas pode-se especular sua participação ativa no mercado ilegal de entorpecentes.\nÉ frequentemente avistado nas periferias de Modest Valley pelos moradores das áreas. Possíveis locais de negociação? Majoritariamente avistado nas periferias do bairro Kennedy Garden. Boatos de atuações criminosas no bairro de Greenville.A Polícia tentou prendê-lo a aproximadamente três anos, sem sucesso. O sujeito conseguiu eliminar quaisquer provas de seu envolvimento com o Caso “Velvet”. O julgamento se encerrou com o “Don Goldberg” saindo ileso das acusações.\nO Delegado Mário Florenza, amigo e conivente com minha investigação, foi demitido de seu cargo após seu envolvimento e responsabilização pelo Caso “Velvet”. Sinais da influência de Don Goldberg nessa demissão são claros.\nAntes da demissão ele investigava contatos indefinidos entre o mafioso e correspondentes chineses. O motivo permanece desconhecido visto o fim de todas as investigações relacionadas a Goldberg (Mais um sinal claro da influência do Mafioso).",
		"foto": preload("res://assets/cartas/arquivo.png")
	},
}

@onready var pages = [ $HBoxContainer/ContainerCapa/ContainerPaginas/ContainerFolhaObjetivos, $HBoxContainer/ContainerCapa/ContainerPaginas/ContainerFolhaCartas, $HBoxContainer/ContainerCapa/ContainerPaginas/ContainerFolhaInventario ]
@onready var botao_esquerda = $HBoxContainer/ContainerSetaEsquerda/ButtonLeft
@onready var botao_direita = $HBoxContainer/ContainerSetaDireita/ButtonRight

@onready var label_objetivos = $HBoxContainer/ContainerCapa/ContainerPaginas/ContainerFolhaObjetivos/ContainerPaginaEsquerda/ContainerObjetivos/LabelObjetivos
var texto_objetivos = "- Ache as cartas (0/2)\n- Desvende o mistério no quadro"

var current_page_index = 0

@onready var container_cartas = $HBoxContainer/ContainerCapa/ContainerPaginas/ContainerFolhaCartas/ContainerPaginaEsquerda/ContainerDocumentos
@onready var label_conteudo = $HBoxContainer/ContainerCapa/ContainerPaginas/ContainerFolhaCartas/ContainerPaginaEsquerda/ContainerDocumentos/ContainerConteudoDocumento/LabelConteudo
@onready var carta_grande = $HBoxContainer/ContainerCapa/ContainerPaginas/ContainerFolhaCartas/ContainerPaginaDireita/CenterContainer/TextureRect

var carta_selecionada = null

func _ready():
	update_pages()
	
	
func _process(_delta: float) -> void:
	update_objetivos()
	

func update_pages():
	for i in pages.size():
		pages[i].visible = (i == current_page_index)


func _on_button_left_pressed() -> void:
	if(current_page_index > 0):
		current_page_index -= 1
		update_pages()
		
		
func _on_button_right_pressed() -> void:
	if(current_page_index < pages.size() - 1):
		current_page_index += 1
		update_pages()
		
"""
func update_cartas() -> void:
	for key in cartas_data.keys():
		if GameState.getValue(key):
			var carta_info = cartas_data[key]
			
			var hbox = HBoxContainer.new()
			
			var foto = TextureRect.new()
			foto.texture = carta_info["foto"]
			foto.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
			foto.custom_minimum_size = Vector2(100, 0)
			hbox.add_child(foto)
			
			var label = Label.new()
			label.text = carta_info["nome"]
			hbox.add_child(label)
			
			hbox.connect("gui_input", _on_carta_selecionada.bind(key))
			
			container_cartas.add_child(hbox)
"""
	

func update_objetivos() -> void:
	var cartas_pegas = 0
	var total_cartas = 2
	
	var cartas_key = ["folhaArrancada", "cartaTerence"]
	
	for key in cartas_key:
		if(GameState.getValue(key)):
			cartas_pegas += 1
	
	texto_objetivos = "- Ache as cartas (%d/%d)\n- Desvende o mistério no quadro" % [cartas_pegas, total_cartas]
	label_objetivos.text = texto_objetivos
	
"""
func _on_carta_selecionada(event: InputEvent, key: String) -> void:
	if(event is InputEventMouseButton):
		carta_selecionada = key
		_show_carta_data(key)
		
		
func _show_carta_data(key: String) -> void:
	var carta_data = cartas_data[key]
	label_conteudo.text = carta_data["conteudo"]
	carta_grande.texture = carta_data["foto"]
"""
