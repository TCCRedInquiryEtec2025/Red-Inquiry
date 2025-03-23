extends CharacterBody3D

const speed = 5.0
const jumpVelocity = 4.5

# Get the gravity from the project settings to be synced with RigidBody nodes
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func _physics_process(delta):
	# Adiciona gravidade
	if !is_on_floor():
		velocity.y -= gravity * delta
		
	if Input.is_action_just_pressed("jump") && is_on_floor():
		velocity.y = jumpVelocity
		
	# Get the input direction and handle the movement/deceleration
	var inputDir = Input.get_vector("walkLeft", "walkRight", "walkUp", "walkDown")
	var direction = (transform.basis * Vector3(inputDir.x, 0, inputDir.y)).normalized()
	
	if direction:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
	
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.z = move_toward(velocity.z, 0, speed)
		
	move_and_slide()
