extends Interactable

var ultima_musica = ""
var musicas: Array = []

func _ready() -> void:
	super._ready()
	
	var dir = DirAccess.open("res://assets/sounds/Musicas/Radio/")
	if dir:
		dir.list_dir_begin()
		var musica = dir.get_next()
		while musica != "":
			if(!dir.current_is_dir()):
				if(musica.ends_with(".mp3") or musica.ends_with(".ogg") or musica.ends_with(".wav")):
					musicas.append("res://assets/sounds/Musicas/Radio/" + musica)
			musica = dir.get_next()
		dir.list_dir_end()
		
		tocar_musica_aleatoria($AudioStreamPlayer3D)
		
	$AudioStreamPlayer3D.finished.connect(_on_music_finished)
	
		
func _on_interacted(_interactable: Variant) -> void:
	$AudioStreamPlayer3D.stop()
	$AudioStreamPlayer3D.stream = load("res://assets/sounds/click-sound-432501.mp3")
	$AudioStreamPlayer3D.play()
	await $AudioStreamPlayer3D.finished
	$AudioStreamPlayer3D.stream = load("res://assets/sounds/am-radio_scrolling-46002.mp3")
	$AudioStreamPlayer3D.play()
	
	await $AudioStreamPlayer3D.finished
	
	tocar_musica_aleatoria($AudioStreamPlayer3D)


func tocar_musica_aleatoria(audio_player: AudioStreamPlayer3D):
	if(musicas.size() == 0):
		return
		
	var path = ultima_musica
	while path == ultima_musica and musicas.size() > 1:
		path = musicas[randi() % musicas.size()]
	
	ultima_musica = path
	
	audio_player.stop()
	audio_player.stream = load(path)
	audio_player.play()


func _on_music_finished():
	tocar_musica_aleatoria($AudioStreamPlayer3D)
