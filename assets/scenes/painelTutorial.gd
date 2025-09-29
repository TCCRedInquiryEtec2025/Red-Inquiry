extends PanelContainer

@onready var vbox = $VBoxContainer
@onready var hbox_andar = $VBoxContainer/Andar
@onready var hbox_correr = $VBoxContainer/Correr
@onready var hbox_agachar = $VBoxContainer/Agachar
@onready var hbox_agenda = $VBoxContainer/Agenda

var andar_done := false
var agachar_done := false
var correr_done := false
var agenda_done := false
	
func _process(_delta: float) -> void:	
	if(!Input.get_vector("walkLeft", "walkRight", "walkUp", "walkDown").is_zero_approx() and not andar_done): # TUTORIAL: ANDAR
		andar_done = true
		fade_out(hbox_andar, true)
	
	if(Input.is_action_just_pressed("crouch") and not agachar_done): # TUTORIAL: AGACHAR
		agachar_done = true
		fade_out(hbox_agachar, true)
		
	if(Input.is_action_just_pressed("sprint") and !Input.get_vector("walkLeft", "walkRight", "walkUp", "walkDown").is_zero_approx() and not correr_done): # TUTORIAL: CORRER
		correr_done = true
		fade_out(hbox_correr, true)
		
	if(Input.is_action_just_pressed("ui_tab") and not agenda_done): # TUTORIAL: AGENDA
		agenda_done = true
		fade_out(hbox_agenda, true)
		
	
func fade_out(node: Control, resize:= false) -> void:	
	var tween := create_tween()
	tween.tween_property(node, "modulate:a", 0, 0.5) # Some em meio segundo
		
	await tween.finished
	
	node.visible = false
		
	vbox.queue_sort()
	if(resize):
		reset_panel()
	if(all_done()):
		hide_self()
	

func reset_panel() -> void:
	vbox.queue_sort()
	queue_sort()
	reset_size()
	
		
func hide_self() -> void:
	var tween := create_tween()
	tween.tween_property(self, "modulate:a", 0, 0.8)
	
	await tween.finished
	
	visible = false


func all_done() -> bool:
	return andar_done and agachar_done and agenda_done and correr_done
