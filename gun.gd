extends Area2D

var is_active: bool = true

func _ready() -> void:
	pass

func _physics_process(delta):
	if not is_active:
		return
	
	var enemies_in_range = get_overlapping_bodies()
	if enemies_in_range.size() > 0:
		var target_enemy = enemies_in_range[0]
		look_at(target_enemy.global_position)
		
		
func shoot():
	if not is_active:
		return
	
	const BULLET = preload("res://bullet.tscn")
	var new_bullet = BULLET.instantiate()
	new_bullet.global_position = %"Shooting Point".global_position
	new_bullet.global_rotation = %"Shooting Point".global_rotation
	%"Shooting Point".add_child(new_bullet)
	


func _on_timer_timeout() -> void:
	shoot()
