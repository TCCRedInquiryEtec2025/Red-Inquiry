extends VBoxContainer

@onready var label = $Label

# Alfabeto inteiro, para alternar;
var letras = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".split()
var index := 0

var botaoCima: Button
var botaoBaixo: Button

func _ready() -> void:
	index = letras.find(label.text.to_upper())
	if(index == -1):
		index = 0
		label.text = letras[index]
		
	# Achando os botões
	for child in get_children():
		if(child is Button):
			if(child.name == "ButtonCima"):
				botaoCima = child
			
			if(child.name == "ButtonBaixo"):
				botaoBaixo = child
				
	botaoBaixo.pressed.connect(_on_down_pressed)
	botaoCima.pressed.connect(_on_up_pressed)
				
func _on_up_pressed() -> void:
	index += 1
	if(index >= letras.size()):
		index = 0
	
	label.text = letras[index]
	

func _on_down_pressed() -> void:
	index -= 1
	if(index < 0):
		index = letras.size() - 1
	
	label.text = letras[index]
		
