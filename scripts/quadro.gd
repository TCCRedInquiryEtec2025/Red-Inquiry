extends Interactable

@onready var label = $Label3D

func _process(_delta: float) -> void:
	label.text = "Carta: " + str(GameState.getValue("Carta1"))

func _on_interacted(_body: Variant) -> void:
	pass
