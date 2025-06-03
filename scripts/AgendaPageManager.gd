extends Control

@onready var pages = [ $CenterContainer/PanelPg1, $CenterContainer/PanelPg2 ]
@onready var button_page1 = $ButtonPage1
@onready var button_page2 = $ButtonPage2

var current_page_index = 0

func _ready():
	# button_page1.pressed.connect(func(): switch_page(0))
	# button_page2.pressed.connect(func(): switch_page(1))
	update_pages()

func _input(event):
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_Q:
			current_page_index = max(0, current_page_index - 1)
			update_pages()
		elif event.keycode == KEY_E:
			current_page_index = min(pages.size() - 1, current_page_index + 1)
			update_pages()

func switch_page(index):
	current_page_index = index
	update_pages()

func update_pages():
	for i in pages.size():
		pages[i].visible = (i == current_page_index)
