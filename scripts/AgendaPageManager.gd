extends Control

@onready var pages = [ $HBoxContainer/ContainerCapa/ContainerPaginas/ContainerFolhaObjetivos, $HBoxContainer/ContainerCapa/ContainerPaginas/ContainerFolhaCartas, $HBoxContainer/ContainerCapa/ContainerPaginas/ContainerFolhaInventario ]
@onready var botao_esquerda = $HBoxContainer/ContainerSetaEsquerda/ButtonLeft
@onready var botao_direita = $HBoxContainer/ContainerSetaEsquerda/ButtonLeft

var current_page_index = 0

func _ready():
	update_pages()
	

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
		
