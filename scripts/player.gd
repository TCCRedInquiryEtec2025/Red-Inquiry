extends CharacterBody3D

@onready var head = $Head
@onready var standCollision = $StandingCollisionShape
@onready var crouchCollision = $CrouchingCollisionShape
@onready var hitSensor = $RayCast3D

const walkingSpeed = 5.0
const sprintSpeed = 8.0
const crouchSpeed = 3.0
const jumpVelocity = 4.5
const mouseSensi = 0.25

var curSpeed = walkingSpeed
var crouchDepth = -0.5
var lerpSpeed = 15.0
var direction = Vector3.ZERO


func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion: # Moves câmera
		rotate_y(deg_to_rad(event.relative.x * mouseSensi) * -1)
		head.rotate_x(deg_to_rad(event.relative.y * mouseSensi) * -1)
		head.rotation.x = clamp(head.rotation.x, deg_to_rad(-80), deg_to_rad(80))

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("crouch"):
		curSpeed = crouchSpeed
		
		head.position.y = lerp(head.position.y, 1.7 + crouchDepth, delta * lerpSpeed)
		
		standCollision.disabled = true
		crouchCollision.disabled = false
	
	elif !hitSensor.is_colliding():
		standCollision.disabled = false
		crouchCollision.disabled = true
		
		head.position.y = lerp(head.position.y, 1.7, delta * lerpSpeed)
		
		if Input.is_action_pressed("sprint"):
			curSpeed = sprintSpeed
			
		else:
			curSpeed = walkingSpeed	
		
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = jumpVelocity

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("walkLeft", "walkRight", "walkUp", "walkDown")
	direction = lerp(direction,(transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized(), delta * lerpSpeed)
	if direction:
		velocity.x = direction.x * curSpeed
		velocity.z = direction.z * curSpeed
	else:
		velocity.x = move_toward(velocity.x, 0, curSpeed)
		velocity.z = move_toward(velocity.z, 0, curSpeed)

	move_and_slide()
