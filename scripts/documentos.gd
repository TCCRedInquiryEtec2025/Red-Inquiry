extends PanelContainer

@onready var carta = $HBoxContainer/CenterContainer/CartaVertical
@onready var jornal = $HBoxContainer/CenterContainer/Jornal

@onready var carta_map = {
	"terence": preload("res://assets/cartas/Carta_Terence.jpg"),
	"joanne": preload("res://assets/cartas/Carta_Joanne_Rochefart.jpg"),
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
		if(interactable.name.to_lower().contains("terence")):
			print(">> Achou a carta do Terence")
			carta.texture = carta_map["terence"]
		elif(interactable.name.to_lower().contains("joanne")):
			print(">> Achou a carta da Joanne")
			carta.texture = carta_map["joanne"]

	$HBoxContainer/VBoxContainer/CenterContainer2/RichTextLabel.text = interactable.texto # Texto contido na carta
