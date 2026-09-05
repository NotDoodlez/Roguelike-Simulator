extends Area2D

var is_active:bool = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta):
	if not is_active:
		return
	
	
	var enemies_in_range = get_overlapping_bodies()
	if enemies_in_range.size() > 0:
		var target_enemy = enemies_in_range[0]
		if is_instance_valid(target_enemy):
			look_at(target_enemy.global_position)
		
		
func shoot():
	if not is_active:
		return
	
	
	const BULLET = preload("res://bullet.tscn")
	var spread_angle: float = 0.15
	var bullet1 = BULLET.instantiate()
	bullet1.global_position = $"WeaponPivot/Shotgun/1st Bullet".global_position
	bullet1.global_rotation = $"WeaponPivot/Shotgun/1st Bullet".global_rotation - spread_angle

	var bullet2 = BULLET.instantiate()
	bullet2.global_position = $"WeaponPivot/Shotgun/2nd Bullet".global_position
	bullet2.global_rotation = $"WeaponPivot/Shotgun/2nd Bullet".global_rotation + spread_angle
	
	get_tree().root.add_child(bullet1)
	get_tree().root.add_child(bullet2)
	
	if Points.shotgun_upgraded:
		var center_bullet = BULLET.instantiate()
		center_bullet.global_position = $"WeaponPivot/Shotgun/1st Bullet".global_position
		center_bullet.global_rotation = $"WeaponPivot/Shotgun/1st Bullet".global_rotation
		get_tree().root.add_child(center_bullet)

func _on_timer_timeout() -> void:
	shoot()
