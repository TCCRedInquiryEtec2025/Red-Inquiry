extends Control

@onready var progress = $PanelContainer/VBoxContainer/CenterContainer2/ProgressBar
var path := "res://scenes/escritorio.tscn"

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
			progress.value = 100
			
			await get_tree().create_timer(1).timeout
			
			var world_scene = ResourceLoader.load_threaded_get(path)
			TransicaoCenas.change_scene_to_packed(world_scene)
			set_process(false)
			
		ResourceLoader.THREAD_LOAD_FAILED:
			push_error("Falha ao carregar a cena: " + path)
			set_process(false)
