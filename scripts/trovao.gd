extends Node

@onready var timer_rng = Timer.new()
@onready var mat = $MeshInstance3D.get_active_material(0) as StandardMaterial3D
@onready var luz = $OmniLight3D

func _ready() -> void:
		loopTrovao()
		
func loopTrovao() -> void:
	while true:
		await get_tree().create_timer(10).timeout # Espera 10s
		print("⚡ Trovão...")
		
		var activated = false
		while !activated:
			await get_tree().create_timer(1).timeout
			activated = await toggleTrovao()
	

func toggleTrovao() -> bool:
	var chance = randi_range(1, 100)
	if chance <= 10: # 10% de chance
		$AudioStreamPlayer3D.play()
		
		
		self.visible = true # Apareçe
		
		await get_tree().create_timer(0.1).timeout		
		self.visible = false # Desapareçe
		
		await get_tree().create_timer(0.1).timeout
		self.visible = true # Aparece
		
		await get_tree().create_timer(0.4).timeout		
		self.visible = false # Desapareçe
		
		return true
	return false
