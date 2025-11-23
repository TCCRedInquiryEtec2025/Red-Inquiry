extends Control

var cartas_data = {
	"folhaArrancada": {
		"nome": "Folha arrancada",
		"conteudo": "Se ele tinha qualquer coisa confidencial a dizer, ele escrevia cifrado, isto é, mudando a ordem das letras do alfabeto, para que nenhuma palavra pudesse ser compreendida. Se alguém deseja decifrar a mensagem e entender seu significado, deve substituir a quarta letra do alfabeto, a saber 'D', por 'A', e assim por diante com as outras…",
		"foto": preload("res://assets/cartas/folhaArrancada.jpg")
	},
	"cartaTerence": {
		"nome": "Carta de Terence",
		"conteudo": "“Yhuphokr hp Juhhqylooh”\n\n“A -> D”\n“A <- D”",
		"foto": preload("res://assets/cartas/Carta_Terence.jpg")
	},
	"cartaJoanne": {
		"nome": "Carta de Joanne",
		"conteudo": "Caro Sr. Connor, Após nossa conversa na última sexta, acreditei que seria melhor que lhe escrevesse essa carta contendo tudo que me lembro em torno do desaparecimento de Terence.\nMeu garoto estava estranho nas semanas anteriores ao sumiço. Falava coisas desconexas, mas jamais as explicava. Sumia por horas andando pela cidade, falava algo de fazer o bem maior quando eu o questionava, mas jamais dizia onde ia. Ele permanecia me evitando ao máximo durante os últimos tempos.\nMe incomoda como posso ajudar tão pouco! No dia que ele desapareceu nada de diferente aconteceu, ele apenas saiu como nos dias anteriores, sem dizer uma única palavra sobre para onde iria e, então, nunca voltou para casa.\nAbsolutamente todos os pertences dele permaneceram no quarto, inclusive o dinheiro que ele guardava, logo, tenho certeza que não foi embora por decisão própria. A carta de Terence que lhe entreguei foi encontrada sob a cômoda do quarto.\nEstou no limite detetive! Sei que não lhe dei muito com o que trabalhar, mas eu te imploro, por favor, ache o meu filho!",
		"foto": preload("res://assets/cartas/Carta_Joanne_Rochefart.jpg")
	},
	"jornal": {
		"nome": "Jornal semanal",
		"conteudo": "“INFORMANTE MORTO A TIROS EM FRENTE A DELEGACIA
			Após tragédia em centro comercial Nova Iorquino e apreensão de aproximadamente três toneladas de entorpecentes na semana passada, suspeito encontrado no local, identificado como Erick Nixon, admitiu vínculo com a Máfia Italiana.\nO criminoso, além de citar local de origem e destino das mercadorias contrabandeadas, prometeu revelar nomes com a devida realização de um acordo cujas cláusulas desconhecemos.\nAo ser transferido para outra delegacia no centro de Nova Iorque para a realização do acordo que lhe fora prometido, um carro não identificado passou em alta velocidade, alvejando o criminoso e outros quatro policiais presentes. Testemunhas dizem que tudo foi rápido demais para que conseguissem citar detalhes.\nO criminoso não resistiu aos ferimentos e faleceu no local, enquanto os policiais baleados estão todos em estado crítico no Hospital Mount Sinai.”",
		"foto": preload("res://assets/cartas/Jornal.png")
	},
	"jornal1": {
		"nome": "Jornal semanal (contrabando)",
		"conteudo": "“CONTRABANDO ANIMAL SE TORNA PREOCUPAÇÃO MUNDIAL
			Após relatório feito pelo OPFF(Órgão Protetor da Fauna e Flora), registrou-se a diminuição de aproximadamente 73% nos animais vertebrados. Dentro do senso, observa-se como as principais afetadas são a fauna latino-americana, africana e da Ásia-Pacífico.\nSomente na África, foi contabilizada a caça ilegal de aproximadamente 1.600 elefantes no último mês, espécie que se tornou alvo para a utilização do marfim de seus chifres.\nNo Brasil, aproximadamente 38 milhões de animais são retirados anualmente da natureza, com apenas 0,45% dos casos sendo apreendidos pelas autoridades.\nInvestiga-se a atuação das mais variadas máfias do mundo no contrabando de animais. As atenções se voltaram para o assunto desde a recente apreensão de 23 espécies em um depósito de Gizé, no Egito, onde uma organização, até então desconhecida, atuava no contrabando constante de espécies africanas para a América…”",
		"foto": preload("res://assets/cartas/Jornal1.png")
	},
	"jornal2": {
		"nome": "Jornal semanal (panda)",
		"conteudo": "“PANDA VERMELHO FAMOSO NO TIBETE DESAPARECE
			O panda vermelho conhecido como Hao, famoso em todo o Tibete por ser o único presente na área de conservação de Hirohito, foi dado como desaparecido na manhã de ontem.\nOs biólogos responsáveis pela observação constante do animal alegam que o panda estava no recinto até a noite passada, quando fizeram seu último registro.\nApós investigações na área, foram achadas marcas de pneu recentes, indicando a passagem de um veículo não autorizado pela área.\nA segurança local atribui o sumiço do animal ao contrabando das mais variadas espécies que vêm assolando toda a região, especialmente após evidências da interligação da máfia italiana com a máfia chinesa.”",
		"foto": preload("res://assets/cartas/Jornal2.png")
	},
	"arquivo": {
		"nome": "Arquivo do mafioso",
		"conteudo": "William Goldberg, notório mafioso com operações em Modest Valley. A extensão de suas operações é desconhecida, mas pode-se especular sua participação ativa no mercado ilegal de entorpecentes.\nÉ frequentemente avistado nas periferias de Modest Valley pelos moradores das áreas. Possíveis locais de negociação? Majoritariamente avistado nas periferias do bairro Kennedy Garden. Boatos de atuações criminosas no bairro de Greenville.A Polícia tentou prendê-lo a aproximadamente três anos, sem sucesso. O sujeito conseguiu eliminar quaisquer provas de seu envolvimento com o Caso “Velvet”. O julgamento se encerrou com o “Don Goldberg” saindo ileso das acusações.\nO Delegado Mário Florenza, amigo e conivente com minha investigação, foi demitido de seu cargo após seu envolvimento e responsabilização pelo Caso “Velvet”. Sinais da influência de Don Goldberg nessa demissão são claros.\nAntes da demissão ele investigava contatos indefinidos entre o mafioso e correspondentes chineses. O motivo permanece desconhecido visto o fim de todas as investigações relacionadas a Goldberg (Mais um sinal claro da influência do Mafioso).",
		"foto": preload("res://assets/cartas/arquivo.png")
	},
}

var itens_data = {
	"flashlight": {
		"descricao": "Uma lanterna. Pode ser utilizada para iluminar lugares escuros.",
		"foto": preload("res://assets/itens/flashlight.png")
	}
}

# UI - Navegação
@onready var pages = [ $HBoxContainer/ContainerCapa/ContainerPaginas/ContainerFolhaObjetivos, $HBoxContainer/ContainerCapa/ContainerPaginas/ContainerFolhaCartas, $HBoxContainer/ContainerCapa/ContainerPaginas/ContainerFolhaInventario ]
@onready var botao_esquerda = $HBoxContainer/ContainerSetaEsquerda/ButtonLeft
@onready var botao_direita = $HBoxContainer/ContainerSetaDireita/ButtonRight

@onready var label_objetivos = $HBoxContainer/ContainerCapa/ContainerPaginas/ContainerFolhaObjetivos/ContainerPaginaEsquerda/ContainerObjetivos/LabelObjetivos
var texto_objetivos = "- Ache as cartas (0/2)\n- Desvende o mistério no quadro"

var current_page_index = 0

# UI - Cartas
@onready var container_cartas = $HBoxContainer/ContainerCapa/ContainerPaginas/ContainerFolhaCartas/ContainerPaginaEsquerda/ContainerDocumentos/VBoxContainer/ScrollContainer/ContainerDocumentos
@onready var label_conteudo = $HBoxContainer/ContainerCapa/ContainerPaginas/ContainerFolhaCartas/ContainerPaginaEsquerda/ContainerDocumentos/ContainerConteudoDocumento/LabelConteudo
@onready var carta_grande = $HBoxContainer/ContainerCapa/ContainerPaginas/ContainerFolhaCartas/ContainerPaginaDireita/CenterContainer/TextureRect

var carta_selecionada = null
var carta_ativa_btn: Button = null

# UI - Itens
@onready var container_itens = $HBoxContainer/ContainerCapa/ContainerPaginas/ContainerFolhaInventario/ContainerPaginaEsquerda/VBoxContainer/ScrollContainer/GridContainer
@onready var label_item = $HBoxContainer/ContainerCapa/ContainerPaginas/ContainerFolhaInventario/ContainerPaginaDireita/VBoxContainer/PanelDescricaoItem/RichTextLabel
@onready var item_grande = $HBoxContainer/ContainerCapa/ContainerPaginas/ContainerFolhaInventario/ContainerPaginaDireita/VBoxContainer/PanelImagemItem/TextureImagemItem

var item_selecionado = null
var item_ativo_btn: Button = null

@export var ray: RayCast3D

func _ready():
	update_pages()
	update_cartas()
	update_itens()
	print("update_cartas chamado")
	
	# Conectando o sinal do InteractRay
	ray.connect("carta_coletada", Callable(self, "_on_carta_coletada"))
	ray.connect("item_coletado", Callable(self, "_on_item_coletado"))
	
	carta_ativa_btn = null
	item_ativo_btn = null
	
func _process(_delta: float) -> void:
	update_objetivos()
	

func update_pages():
	for i in range(pages.size()):
		pages[i].visible = (i == current_page_index)


func _on_button_left_pressed() -> void:
	if(current_page_index > 0):
		current_page_index -= 1
		update_pages()
		
		
func _on_button_right_pressed() -> void:
	if(current_page_index < pages.size() - 1):
		current_page_index += 1
		update_pages()
		
		
func update_cartas() -> void:
	for child in container_cartas.get_children():
		child.queue_free()
	
	for key in cartas_data.keys():
		if GameState.getValue(key):
			var carta_info = cartas_data[key]
			
			# Criando o botão da carta
			var btnCarta = Button.new()
			btnCarta.disabled = false
			btnCarta.flat = true
			btnCarta.toggle_mode = true
			btnCarta.action_mode = BaseButton.ACTION_MODE_BUTTON_PRESS
			btnCarta.button_mask = MOUSE_BUTTON_MASK_LEFT
			btnCarta.custom_minimum_size = Vector2(0, 150)
			btnCarta.size_flags_horizontal = Control.SIZE_FILL
			btnCarta.size_flags_vertical = Control.SIZE_EXPAND_FILL
			
			# Criando o painel de fundo da carta
			var panelCarta = PanelContainer.new()
			panelCarta.anchor_left = 0
			panelCarta.anchor_top = 0
			panelCarta.anchor_right = 1
			panelCarta.anchor_bottom = 1
			panelCarta.offset_left = 0
			panelCarta.offset_top = 0
			panelCarta.offset_bottom = 0
			panelCarta.offset_right = 0
			
			var panelStyle = StyleBoxFlat.new()
			panelStyle.bg_color = Color(0, 0, 0, 0)
			panelStyle.draw_center = true
			panelStyle.border_width_bottom = 2
			panelStyle.border_width_top = 2
			panelStyle.border_width_left = 2
			panelStyle.border_width_right = 2
			panelStyle.border_color = Color(0,0,0)
			panelStyle.corner_radius_bottom_left = 2
			panelStyle.corner_radius_top_left = 2
			panelStyle.corner_radius_bottom_right = 2
			panelStyle.corner_radius_top_right = 2
			panelStyle.content_margin_bottom = 1
			panelStyle.content_margin_top = 1
			panelStyle.content_margin_left = 1
			panelStyle.content_margin_right = 1
			panelCarta.mouse_filter = Control.MOUSE_FILTER_IGNORE
			panelCarta.add_theme_stylebox_override("panel", panelStyle)
			
			var hbox = HBoxContainer.new()
			hbox.size_flags_horizontal = Control.SIZE_EXPAND_FILL # Carta vai expandir e preencher o espaço todo
			hbox.custom_minimum_size = Vector2(0, 160)
			hbox.mouse_filter = Control.MOUSE_FILTER_IGNORE
			
			var centerFoto = CenterContainer.new()
			centerFoto.size_flags_horizontal = Control.SIZE_EXPAND_FILL
			centerFoto.size_flags_vertical = Control.SIZE_FILL
			centerFoto.size_flags_stretch_ratio = 0.6
			centerFoto.mouse_filter = Control.MOUSE_FILTER_IGNORE
			
			var foto = TextureRect.new()
			foto.texture = carta_info["foto"]
			foto.expand_mode = TextureRect.EXPAND_FIT_HEIGHT_PROPORTIONAL
			if("Jornal semanal" in carta_info["nome"]):
				# Se for o jornal, ajusta para caber de acordo
				foto.expand_mode = TextureRect.EXPAND_FIT_WIDTH_PROPORTIONAL
			foto.custom_minimum_size = Vector2(100, 100)
			foto.mouse_filter = Control.MOUSE_FILTER_IGNORE
			centerFoto.add_child(foto)
			
			var centerLabel = CenterContainer.new()
			centerLabel.size_flags_horizontal = Control.SIZE_EXPAND_FILL
			centerLabel.mouse_filter = Control.MOUSE_FILTER_IGNORE
			
			var label = Label.new()
			label.text = carta_info["nome"]
			label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
			label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
			label.add_theme_color_override("font_color", Color(0, 0, 0))
			var f = load("res://assets/fonts/IMFeENsc28P.ttf")
			label.add_theme_font_override("font", f)
			label.add_theme_font_size_override("font_size", 25)
			label.mouse_filter = Control.MOUSE_FILTER_IGNORE
			centerLabel.add_child(label)
			
			hbox.add_child(centerFoto)
			hbox.add_child(centerLabel)
			panelCarta.add_child(hbox)
			btnCarta.add_child(panelCarta)
			
			btnCarta.connect("pressed", Callable.create(self, "_on_carta_selecionada").bind(key, btnCarta))
			container_cartas.add_child(btnCarta)
	

func update_objetivos() -> void:
	var cartas_pegas = 0
	var total_cartas = 2
	
	var cartas_key = ["folhaArrancada", "cartaTerence"]
	
	for key in cartas_key:
		if(GameState.getValue(key)):
			cartas_pegas += 1
	
	texto_objetivos = "- Ache as cartas (%d/%d)\n- Desvende o mistério no quadro" % [cartas_pegas, total_cartas]
	label_objetivos.text = texto_objetivos
	
func update_itens() -> void:
	for child in container_itens.get_children():
		child.queue_free()
		
	label_item.text = "Aqui aparecerá a descrição do item"
	item_grande.visible = false
	
	for key in itens_data.keys():
		if GameState.getValue(key):
			var item_info = itens_data[key]
			
			# Criando o botão do item
			var btnItem = Button.new()
			btnItem.disabled = false
			btnItem.flat = true
			btnItem.toggle_mode = true
			btnItem.action_mode = BaseButton.ACTION_MODE_BUTTON_PRESS
			btnItem.button_mask = MOUSE_BUTTON_MASK_LEFT
			btnItem.custom_minimum_size = Vector2(200, 200)
			btnItem.size_flags_horizontal = Control.SIZE_FILL
			btnItem.size_flags_vertical = Control.SIZE_FILL
			
			# Criando o painel de fundo do item
			var panelItem = PanelContainer.new()
			panelItem.set_anchors_preset(Control.PRESET_FULL_RECT)
			
			var itemStyle = StyleBoxFlat.new()
			itemStyle.bg_color = Color(0, 0, 0, 0)
			itemStyle.draw_center = true
			itemStyle.corner_detail = 5
			itemStyle.border_width_bottom = 3
			itemStyle.border_width_top = 3
			itemStyle.border_width_left = 3
			itemStyle.border_width_right = 3
			itemStyle.border_color = Color(0,0,0)
			itemStyle.border_blend = true
			itemStyle.corner_radius_bottom_left = 10
			itemStyle.corner_radius_top_left = 10
			itemStyle.corner_radius_bottom_right = 10
			itemStyle.corner_radius_top_right = 10
			itemStyle.content_margin_bottom = 30
			itemStyle.content_margin_top = 30
			itemStyle.content_margin_left = 30
			itemStyle.content_margin_right = 30
			panelItem.mouse_filter = Control.MOUSE_FILTER_IGNORE
			panelItem.add_theme_stylebox_override("panel", itemStyle)
			
			var centerContainer = CenterContainer.new()
			centerContainer.mouse_filter = Control.MOUSE_FILTER_IGNORE
			panelItem.add_child(centerContainer)
			
			var foto = TextureRect.new()
			foto.texture = item_info["foto"]
			foto.expand_mode = TextureRect.EXPAND_FIT_HEIGHT_PROPORTIONAL
			foto.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
			foto.custom_minimum_size = Vector2(100, 100)
			foto.mouse_filter = Control.MOUSE_FILTER_IGNORE
			
			centerContainer.add_child(foto)
			btnItem.add_child(panelItem)
			
			btnItem.connect("pressed", Callable.create(self, "_on_item_selecionado").bind(key, btnItem))
			container_itens.add_child(btnItem)
	
	
func _on_carta_selecionada(key: String, btn: Button) -> void:
	# Desmarcando a carta ativa anteriormente
	if(carta_ativa_btn and carta_ativa_btn != btn):
		carta_ativa_btn.button_pressed = false
	
	# Atualizando a carta ativa
	carta_ativa_btn = btn
	carta_ativa_btn.button_pressed = true
	
	# Mostrando os dados
	_show_carta_data(key)
	
	
func _on_item_selecionado(key: String, btn: Button) -> void:
	# Desmarcando o item ativo anteriormente
	if(item_ativo_btn and item_ativo_btn != btn):
		item_ativo_btn.button_pressed = false
	
	# Atualizando o item ativa
	item_ativo_btn = btn
	item_ativo_btn.button_pressed = true
	
	# Mostrando os dados
	_show_item_data(key)
		
		
func _show_carta_data(key: String) -> void:
	print("show_carta_data() chamado. key: ", key)
	var carta_data = cartas_data[key]
	label_conteudo.text = carta_data["conteudo"]
	carta_grande.texture = carta_data["foto"]
	
func _show_item_data(key: String) -> void:
	print("show_item_data() chamado. key: ", key)
	var item_data = itens_data[key]
	label_item.text = item_data["descricao"]
	
	item_grande.visible = true
	item_grande.texture = item_data["foto"]


func _on_carta_coletada(nome_carta: String) -> void:
	print("Carta coletada: ", nome_carta)
	update_cartas()
	

func _on_item_coletado(nome_item: String) -> void:
	print("Item coletado: ", nome_item)
	update_itens()
