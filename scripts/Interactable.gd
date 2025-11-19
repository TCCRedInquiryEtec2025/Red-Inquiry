extends CollisionObject3D
class_name Interactable

signal interacted(interactable)

@onready var mesh: MeshInstance3D
@onready var material: StandardMaterial3D

@export var prompt_message = "Interagir"
@export var prompt_input = "interact"
@export var response_prompt = ""

func _ready() -> void:		
	mesh = find_first_mesh(self)
	
	if(!mesh):
		print("AVISO: Interagível ", name, " não possui MeshInstance3D")
		
	else:
		material = mesh.get_active_material(0)
	

func find_first_mesh(node: Node) -> MeshInstance3D:
	for child in node.get_children():
		if(child is MeshInstance3D):
			return child
		var deeper = find_first_mesh(child)
		if(deeper):
			return deeper
	return null
			
	

func enable_highlight() -> void:
	if(material and material is StandardMaterial3D and name != "PortaSaida"):
		material.stencil_mode = StandardMaterial3D.STENCIL_MODE_OUTLINE
		material.stencil_outline_thickness = 0.05
		if(name == "Quadro"):
			material.stencil_outline_thickness = 0.01
		if(name == "Radio"):
			material.stencil_outline_thickness = 0.5
		material.stencil_color = Color.WHITE 
	

func disable_highlight() -> void:
	if(material and material is StandardMaterial3D):
		material.stencil_mode = StandardMaterial3D.STENCIL_MODE_DISABLED

func get_prompt():
	if(prompt_input == null):
		print("DEBUG: ", name, " prompt_input está NULL no get_prompt, mas setado no inspetor.")
	
	var keyName = "TECLA"
	for action in InputMap.action_get_events(prompt_input):
		if action is InputEventKey:
			keyName = action.as_text_physical_keycode()
			break
			
	return prompt_message + "\n[" + keyName + "]"
	
	
func interact(body):
	print(body.name + " interacted with " + name)
	interacted.emit(self)
