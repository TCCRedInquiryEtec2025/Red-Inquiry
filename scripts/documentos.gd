extends PanelContainer

@onready var carta = $HBoxContainer/CenterContainer/CartaVertical
@onready var jornal = $HBoxContainer/CenterContainer/Jornal

@onready var label = $HBoxContainer/VBoxContainer/CenterContainer2/PanelContainer/RichTextLabel

@onready var carta_map = {
	"terence": preload("res://assets/cartas/Carta_Terence.jpg"),
	"joanne": preload("res://assets/cartas/Carta_Joanne_Rochefart.jpg"),
	"arquivo": preload("res://assets/cartas/arquivo.png"),
	"folha_arrancada": preload("res://assets/cartas/folhaArrancada.jpg"),
	
	"jornal": preload("res://assets/cartas/Jornal.png"),
	"jornal1": preload("res://assets/cartas/Jornal1.png"),
	"jornal2": preload("res://assets/cartas/Jornal2.png"),
}

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
	if GameState.getValue("abrindoAgenda") or GameState.getValue("pauseAberto"): return
	
	GameState.setValue("lendo", true)
	GameState.setValue("podeAndar", false)
	visible = true
	
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
	
	if(interactable.tipo == interactable.TipoCarta.Jornal):
		label.scroll_to_line(0)
		
		if(interactable.name.to_lower() == "jornalsemanal"):
			print(">> Achou o jornal principal")
			jornal.texture = carta_map["jornal"]
		elif(interactable.name.to_lower() == "jornalsemanal1"):
			print(">> Achou o jornal sobre maus-tratos")
			jornal.texture = carta_map["jornal1"]
		elif(interactable.name.to_lower() == "jornalsemanal2"):
			print(">> Achou o jornal sobre o panda")
			jornal.texture = carta_map["jornal2"]
		else:
			print(">> Achou um jornal não identificado")
			jornal.texture = PlaceholderTexture2D.new()

	label.text = interactable.texto # Texto contido na carta
