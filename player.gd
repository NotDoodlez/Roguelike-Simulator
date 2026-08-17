extends CharacterBody2D

signal health_depleted

var health = 100.0

func _ready() -> void:
	equip_weapon(Points.equipped_weapon)

func equip_weapon(weapon_name: String) -> void:
	var choice = weapon_name.to_lower().replace(" ", "").replace("_", "").strip_edges()
	
	for child in get_children():
		var child_name_lower = child.name.to_lower().replace(" ", "").replace("_", "")
		var is_match = false
		
		
		if "shot" in choice and child_name_lower == "shotgun":
			is_match = true
		elif ("pistol" in choice or ("gun" in choice and not "shot" in choice)) and child_name_lower == "gun":
			is_match = true
			
		if child_name_lower == "gun" or child_name_lower == "shotgun":
			if is_match:
				activate_weapon(child)
			else:
				deactivate_weapon(child)
			
func activate_weapon(weapon: Node) -> void:
	weapon.visible = true
	if "is_active" in weapon:
		weapon.is_active = true
	
	var timer = weapon.get_node_or_null("Timer")
	if timer:
		timer.paused = false
		if timer.is_stopped():
			timer.start()

func deactivate_weapon(weapon: Node) -> void:
	weapon.visible = false
	if "is_active" in weapon:
		weapon.is_active = false
	
	var timer  = weapon.get_node_or_null("Timer")
	if timer:
		timer.paused = true


func _physics_process(delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * 600
	move_and_slide()
	if velocity.length() > 0.0:
		$HappyBoo.play_walk_animation()
	else:
		$HappyBoo.play_idle_animation()
	

	
	
	const DAMAGE_RATE = 5.0
	var overlapping_mobs = %HurtBox.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		health -= DAMAGE_RATE * overlapping_mobs.size() * delta
		%ProgressBar.value = health
		if health <= 0.0:
			health_depleted.emit()
			$"../CanvasLayer3/GameOver"._on_player_health_depleted()
