extends Node

signal carta_obtida(key: String)

var state := {
	"folhaArrancada": false,
	"cartaTerence" : false,
	"cartaJoanne": false,
	"jornal": false,
	"arquivo": false,
	
	"pauseAberto": false,
	"abrindoAgenda": false,
	"lendo": false,
	"podeAndar": true,
	
	"andando": false,
	"correndo": false,
	"agachando": false,
}

func getValue(key):
	if(state.has(key)):
		return state[key]
		
	printerr("Chave não encontrada: ", key)
	

func setValue(key: String, value: bool) -> void:
	state[key] = value
	if(key in ["cartaTerence", "folhaArrancada"] and value):
		emit_signal("carta_obtida", key)
