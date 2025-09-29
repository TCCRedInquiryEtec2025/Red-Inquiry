extends Control

@onready var label = $MarginContainer/LabelTexto
var lines: int

@onready var label_pular = $MarginContainer/LabelPular

var frases := [
	"Fazia apenas um dia desde que havia recebido um novo caso. ",
	"Após horas tentando resolver o mistério, me deparei com uma noite chuvosa e soturna.",
	"Não demorei em me afogar em minha incompetência e, consequentemente, acabar pegando no sono.",
	"Acordei assustado e desorientado com um estrondoso trovão, pouco me lembrando de quaisquer avanços que, por ventura, tivesse obtido.",
	"Haviam se passado horas desde meus últimos esforços e o tempo não estava a meu favor: Um caso envolvendo uma pessoa desaparecida exige pressa. ",
	"Me lembrava de ter encontrado o que poderia ser a chave para solucionar o código deixado pela vítima, um trecho de um livro que explicava a tática de decodificação.",
	"Naquele momento, no entanto, não me lembrava nem do código e nem onde eu havia deixado a folha…",
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
	
	TransicaoCenas.change_scene_to_packed(TransicaoCenas.cena_escritorio)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("jump"):
		if(TransicaoCenas.cena_escritorio):
			TransicaoCenas.change_scene_to_packed(TransicaoCenas.cena_escritorio)
		else:
			print("⚠ Cena ainda não foi carregada")


func pular_pisca() -> void:
	while(true):
		var tweenPular = create_tween()
		tweenPular.tween_property(label_pular, "modulate:a", 0.4, 0.5)
		await tweenPular.finished
				
		tweenPular = create_tween() # Fade-in
		tweenPular.tween_property(label_pular, "modulate:a", 1, 0.5)
		await tweenPular.finished
