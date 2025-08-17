extends Interactable

@onready var card1 = $Meshes/Note01
@onready var card2 = $Meshes/Note02
@onready var card3 = $Meshes/Note03

func _process(_delta: float) -> void:
	var qtd_cartas = GameState.getValue("Carta1")
	var cartas = [card1, card2, card3]
	
	for i in range(qtd_cartas):
		if i < cartas.size():
			cartas[i].show()

func _on_interacted(_body: Variant) -> void:
	pass
