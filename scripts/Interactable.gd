extends CollisionObject3D
class_name Interactable

signal interacted(body)

@export var prompt_message = "Interagir"
@export var prompt_input = "interact"
@export var response_prompt = ""

func get_prompt():
	var keyName = "TECLA"
	for action in InputMap.action_get_events(prompt_input):
		if action is InputEventKey:
			keyName = action.as_text_physical_keycode()
			break
			
	return prompt_message + "\n[" + keyName + "]"
	
	
func interact(body):
	print(body.name + " interacted with " + name)
	interacted.emit(body)
