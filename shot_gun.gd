extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta):
	var enemies_in_range = get_overlapping_bodies()
	if enemies_in_range.size() > 0:
		var target_enemy = enemies_in_range[0]
		look_at(target_enemy.global_position)
		
		
func shoot():
	const BULLET = preload("res://bullet.tscn")
	var new_bullet = BULLET.instantiate()
	new_bullet.global_position = %"1st Bullet".global_position
	new_bullet.global_rotation = %"2nd Bullet".global_rotation
	%"1st Bullet".add_child(new_bullet)
	%"2nd Bullet".add_child(new_bullet)
	


func _on_timer_timeout() -> void:
	shoot()
