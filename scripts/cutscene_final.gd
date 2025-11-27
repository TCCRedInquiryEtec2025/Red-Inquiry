extends Control

@onready var label = $MarginContainer/LabelTexto
var lines: int

@onready var label_pular = $MarginContainer/LabelPular

var frases := [
	"‘Vermelho em Greenville’, seja lá o que Terence Rochefort queria dizer com aquilo eu não fazia a menor ideia do que podia ser.",
	"Ao menos me disse onde procurar: Greenville, um bairro periférico e misterioso.",
	"Por muito tempo rondei pelas áreas periféricas da cidade e sempre me deparei com um velho galpão sombrio e fora de atividade.",
	"Se algum local estava destinado a ser um bom ponto de partida, meu chute era aquele.",
	"Joanne estava desesperada com o bem estar de seu filho, e eu determinado a garantir tal coisa.",
	"Precisava correr contra o tempo, ir de imediato até o galpão em Greenville e rezar para pelo menos encontrar alguma pista do paradeiro de Terence.",
	"A chuva persistia e a noite estava apenas começando, assim como minha investigação.",
]

func _ready() -> void:
	lines = label.get_line_count()
	
	label.modulate.a = 0
	
	pular_pisca()
	
	for i in range(frases.size()):	
		label.text = frases[i]
		
		var tween = create_tween()
		tween.tween_property(label, "modulate:a", 1, 0.5)
		await tween.finished
		
		var time = 3 + (lines * 3)
		await get_tree().create_timer(time).timeout # Tempo que a mensagem fica na tela
			
		tween = create_tween() # Fade-out
		tween.tween_property(label, "modulate:a", 0, 0.8)
		await tween.finished
	
	TransicaoCenas.change_scene("res://scenes/menuInicial.tscn")

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("jump"):
		TransicaoCenas.change_scene("res://scenes/menuInicial.tscn")


func pular_pisca() -> void:
	while(true):
		var tweenPular = create_tween()
		tweenPular.tween_property(label_pular, "modulate:a", 0.4, 0.5)
		await tweenPular.finished
				
		tweenPular = create_tween() # Fade-in
		tweenPular.tween_property(label_pular, "modulate:a", 1, 0.5)
		await tweenPular.finished
