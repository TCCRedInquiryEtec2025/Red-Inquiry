extends PanelContainer

@onready var carta = $HBoxContainer/CenterContainer/CartaVertical
@onready var jornal = $HBoxContainer/CenterContainer/Jornal

@onready var label = $HBoxContainer/VBoxContainer/CenterContainer2/PanelContainer/RichTextLabel

@onready var carta_map = {
	"terence": preload("res://assets/cartas/Carta_Terence.jpg"),
	"joanne": preload("res://assets/cartas/Carta_Joanne_Rochefart.jpg"),
	"arquivo": preload("res://assets/cartas/arquivo.png"),
	"folha_arrancada": preload("res://assets/cartas/folhaArrancada.jpg"),
}

func _process(_delta: float) -> void:
	if(GameState.getValue("lendo")):
		visible = true

func _ready() -> void:
	visible = false
	
	jornal.visible = false
	carta.visible = false
	
	for node in get_tree().get_nodes_in_group("legiveis"):
		node.connect("interacted", _on_interacted)
	

func _on_button_pressed() -> void:
	GameState.setValue("lendo", false)
	GameState.setValue("podeAndar", true)
	
	jornal.visible = false
	carta.visible = false
	
	self.visible = false

func _on_interacted(interactable: Carta) -> void:
	GameState.setValue("lendo", true)
	GameState.setValue("podeAndar", false)
	
	jornal.visible = false
	carta.visible = false
	
	match interactable.tipo:
		interactable.TipoCarta.Carta:
			carta.visible = true
		interactable.TipoCarta.Jornal:
			jornal.visible = true

	if(interactable.tipo == interactable.TipoCarta.Carta):
		label.scroll_to_line(0)
		
		if(interactable.name.to_lower().contains("terence")):
			print(">> Achou a carta do Terence")
			carta.texture = carta_map["terence"]
		elif(interactable.name.to_lower().contains("joanne")):
			print(">> Achou a carta da Joanne")
			carta.texture = carta_map["joanne"]
		elif(interactable.name.to_lower().contains("arquivo")):
			print(">> Achou o arquivo")
			carta.texture = carta_map["arquivo"]
		elif(interactable.name.to_lower().contains("arrancada")):
			print(">> Achou a folha arrancada")
			carta.texture = carta_map["folha_arrancada"]
			
		else:
			print(">> Achou uma carta não identificada")
			carta.texture = PlaceholderTexture2D.new()

	label.text = interactable.texto # Texto contido na carta
