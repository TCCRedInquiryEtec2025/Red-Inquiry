extends Node

var volume_geral: float = 1.0
var volume_musica: float = 1.0
var sensibilidade:float = 0.25

func set_volume_geral(value: float) -> void:
	volume_geral = value
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), linear_to_db(value))
	
	
func set_volume_musica(value: float) -> void:
	volume_musica = value
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), linear_to_db(value))
	
	
func set_sensibilidade(value: float) -> void:
	sensibilidade = value
	
