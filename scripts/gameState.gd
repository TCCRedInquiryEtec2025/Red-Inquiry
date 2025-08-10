extends Node

var state := {
	"Carta1": false
}

func getValue(key):
	if(state.has(key)):
		return state[key]
		
	printerr("Key not present in state: ", key)
	

func setValue(key, value):
	state[key] = value
