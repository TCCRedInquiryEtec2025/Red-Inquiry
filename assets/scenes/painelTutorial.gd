extends PanelContainer

@onready var vbox: VBoxContainer = $VBoxContainer
@onready var anim_player: AnimationPlayer = $AnimationPlayer

var andar_done := false
var agachar_done := false
var correr_done := false

var _resize_tween: Tween = null


func _ready():
	anim_player.animation_finished.connect(_on_anim_finished)
	
	
func _process(_delta: float) -> void:
	var input_dir := Input.get_vector("walkLeft", "walkRight", "walkUp", "walkDown")
	
	if(!input_dir.is_zero_approx() and not andar_done): # TUTORIAL: ANDAR
		andar_done = true
		anim_player.play("handleAndar")
	
	if(Input.is_action_just_pressed("crouch") and not agachar_done): # TUTORIAL: AGACHAR
		agachar_done = true
		anim_player.play("handleAgachar")
		
	if(Input.is_action_just_pressed("sprint") and not correr_done): # TUTORIAL: CORRER
		correr_done = true
		anim_player.play("handleCorrer")
		
	
func _on_anim_finished(anim_name: String):
	if(anim_name == "handleAndar"):
		$VBoxContainer/Andar.visible = false
		animate_resize()
	
	elif(anim_name == "handleAgachar"):
		$VBoxContainer/Agachar.visible = false
		animate_resize()
		
	elif(anim_name == "handleCorrer"):
		$VBoxContainer/Correr.visible = false
		animate_resize()
		
	if(andar_done && agachar_done && correr_done):
		await get_tree().create_timer(1).timeout
			
		var tween = create_tween()
		tween.tween_property(self, "modulate:a", 0, 0.8)			
		tween.finished.connect(queue_free)


func animate_resize():
	if(not is_inside_tree()):
		return
		
	var old_size = size
	
	# força recálculo do layout dos containers
	vbox.queue_sort()
	# espera 1-2 frames pra garantir que o layout foi atualizado
	await get_tree().process_frame
	await get_tree().process_frame
	
	var new_size = size
	
	# Pega o tamanho do viewport para evitar pedir um tamanho inválido
	var vp_size := get_viewport().get_visible_rect().size
	
	# Aplica limites mínimos (500x300) e limites máximos baseados no viewport
	new_size.x = clamp(new_size.x, 500, max(vp_size.x - 2, 1))
	new_size.y = clamp(new_size.y, 300, max(vp_size.y - 2, 1))
	
	# Garante que não seja 0/NAN
	new_size.x = max(new_size.x, 1)
	new_size.y = max(new_size.y, 1)
	
	if(_resize_tween and is_instance_valid(_resize_tween)):
		_resize_tween.kill()
		_resize_tween = null
		
	_resize_tween = create_tween()
	var tprop = _resize_tween.tween_property(self, "size", new_size, 0.6)
	if(tprop):
		tprop.from(old_size)
	else:
		push_warning("animate_resize: tween_property retornou null; pulando animação")
