extends Control

@onready var progress = $PanelContainer/MarginContainer/VBoxContainer/ProgressBar
@onready var label = $PanelContainer/MarginContainer/VBoxContainer/Label
var path := "res://scenes/escritorio.tscn"

var load_concluido := false

func _ready():	
	ResourceLoader.load_threaded_request(path, "PackedScene")
	progress.value = 0
	set_process(true)
	

func _process(_delta: float) -> void:
	var progress_array := []
	var status = ResourceLoader.load_threaded_get_status(path, progress_array)
	
	match status:
		ResourceLoader.THREAD_LOAD_IN_PROGRESS:
			progress.value = progress_array[0] * 100
		
		ResourceLoader.THREAD_LOAD_LOADED:
			TransicaoCenas.cena_escritorio = ResourceLoader.load_threaded_get(path)
			progress.value = 100
			load_concluido = true
			label.text = "PRESSIONE QUALQUER TECLA PARA CONTINUAR"
			
		ResourceLoader.THREAD_LOAD_FAILED:
			push_error("Falha ao carregar a cena: " + path)
			set_process(false)


func _input(event: InputEvent) -> void:
	if(load_concluido and event is InputEventKey):
		TransicaoCenas.change_scene("res://scenes/cutscene.tscn")
		set_process(false)
			
