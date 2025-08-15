extends CharacterBody3D

# Player nodes
@onready var neck = $Neck
@onready var head = $Neck/Head
@onready var eyes = $Neck/Head/Eyes

@onready var standCollision = $StandingCollisionShape
@onready var crouchCollision = $CrouchingCollisionShape
@onready var hitSensor = $HeadChecker
@onready var camera_3d = $Neck/Head/Eyes/Camera3D

# Speed vars
var curSpeed = walkingSpeed
var can_move = true

const walkingSpeed = 2.0
const sprintSpeed = walkingSpeed * 2
const crouchSpeed = walkingSpeed / 2

# States
var walking = false
var sprinting = false
var crouching = false
var freeLooking = false
var sliding = false

# Slide vars
var slideTimer = 0.0
var slideTimerMax = 1.0
var slideSpeed = 5.5
var slideVector = Vector2.ZERO

# Head bobbing vars
const headBobbingSprintingSpeed = 10.0
const headBobbingWalkingSpeed = 6.0
const headBobbingCrouchingSpeed = 4.5

const headBobbingSprintingIntensity = 0.3
const headBobbingWalkingIntensity = 0.1
const headBobbingCrouchingIntensity = 0.08
var headBobbingCurIntensity = 0.0

var headBobbingVector = Vector2.ZERO
var headBobbingIndex = 0.0

# Movement vars
var crouchDepth = -0.5

const jumpVelocity = 3

var lerpSpeed = 8.0

var freeLookTiltAmount = 8

# Input vars
var direction = Vector3.ZERO
const mouseSensi = 0.25

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event: InputEvent) -> void:	
	# Mouse looking logic
	if(can_move) == false:
		return
	
	if event is InputEventMouseMotion: # Moves camera
		if freeLooking:
			neck.rotate_y(deg_to_rad(event.relative.x * mouseSensi) * -1)
			neck.rotation.y = clamp(neck.rotation.y, deg_to_rad(-120), deg_to_rad(120))
		else:
			rotate_y(deg_to_rad(event.relative.x * mouseSensi) * -1)
			
		head.rotate_x(deg_to_rad(event.relative.y * mouseSensi) * -1)
		head.rotation.x = clamp(head.rotation.x, deg_to_rad(-80), deg_to_rad(80)) # Não deixa a câmera virar 360 lol

func _physics_process(delta: float) -> void:
	# Getting movement input
	var input_dir := Input.get_vector("walkLeft", "walkRight", "walkUp", "walkDown")
	# Handle movement state
	if can_move == false:
		return
	
	# Crouching
	if Input.is_action_pressed("crouch") or sliding:
		curSpeed = crouchSpeed
		
		head.position.y = lerp(head.position.y, crouchDepth, delta * lerpSpeed)
		
		standCollision.disabled = true
		crouchCollision.disabled = false
		
		# Slide begin logic
		if sprinting && input_dir != Vector2.ZERO:
			sliding = true
			slideTimer = slideTimerMax
			slideVector = input_dir
			freeLooking = true
			print("Slide begin")
		
		walking = false
		sprinting = false
		crouching = true
	
	# Standing
	elif !hitSensor.is_colliding():
		standCollision.disabled = false
		crouchCollision.disabled = true
		
		head.position.y = lerp(head.position.y, 0.0, delta * lerpSpeed)
		
		if Input.is_action_pressed("sprint"):
			# Sprinting
			curSpeed = sprintSpeed
			
			walking = false
			sprinting = true
			crouching = false
			
		else:
			# Walking
			curSpeed = walkingSpeed
			
			walking = true
			sprinting = false
			crouching = false
			
	# Handle freelooking
	if Input.is_action_pressed("freeLook") or sliding:
		freeLooking = true
		
		if sliding:
			camera_3d.rotation.z = lerp(camera_3d.rotation.z, -deg_to_rad(7), delta * lerpSpeed)
		else:
			camera_3d.rotation.z = -deg_to_rad(neck.rotation.y * freeLookTiltAmount)
	else:
		freeLooking = false
		neck.rotation.y = lerp(neck.rotation.y, 0.0, delta * lerpSpeed)
		camera_3d.rotation.z = lerp(camera_3d.rotation.z, 0.0, delta * lerpSpeed)
		
	# Handle sliding
	if sliding:
		slideTimer -= delta
		if slideTimer <= 0:
			sliding = false
			freeLooking = false
			print("Slide ends")
			
	# Handle Headbob
	if sprinting:
		headBobbingCurIntensity = headBobbingSprintingIntensity
		headBobbingIndex += headBobbingSprintingSpeed * delta
	
	elif walking:
		headBobbingCurIntensity = headBobbingWalkingIntensity
		headBobbingIndex += headBobbingWalkingSpeed * delta
	
	elif crouching:
		headBobbingCurIntensity = headBobbingCrouchingIntensity
		headBobbingIndex += headBobbingCrouchingSpeed * delta
		
	if is_on_floor() and !sliding and input_dir != Vector2.ZERO:
		headBobbingVector.y = sin(headBobbingIndex)
		headBobbingVector.x = sin(headBobbingIndex / 2) + 0.5
		
		eyes.position.y = lerp(eyes.position.y, headBobbingVector.y * (headBobbingCurIntensity/2), delta * lerpSpeed)
		eyes.position.x = lerp(eyes.position.x, headBobbingVector.x * headBobbingCurIntensity, delta * lerpSpeed)
		
	else:
		eyes.position.y = lerp(eyes.position.y, 0.0, delta * lerpSpeed)
		eyes.position.x = lerp(eyes.position.x, 0.0, delta * lerpSpeed)
		
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = jumpVelocity
		sliding = false

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = lerp(direction,(transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized(), delta * lerpSpeed)
	
	if sliding:
		direction = (transform.basis * Vector3(slideVector.x, 0, slideVector.y)).normalized()
	
	if direction:
		velocity.x = direction.x * curSpeed
		velocity.z = direction.z * curSpeed
		
		if sliding:
			velocity.x = direction.x * (slideTimer + 0.3) * slideSpeed
			velocity.z = direction.z * (slideTimer + 0.3) * slideSpeed
	else:
		velocity.x = move_toward(velocity.x, 0, curSpeed)
		velocity.z = move_toward(velocity.z, 0, curSpeed)
		
	move_and_slide()
