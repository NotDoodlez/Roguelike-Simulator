extends Node2D



func spawn_mob():
	var new_mob = preload("res://mob.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)


func spawn_tree():
	var new_tree = preload("res://Pine_tree.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_tree.global_position = %PathFollow2D.global_position
	add_child(new_tree)


func _on_timer_timeout() -> void:
	spawn_mob()



func _on_player_health_depleted() -> void:
	%GameOver.visible = true   #displays the Game over screen
	get_tree().paused = true    #pauses the whole game


func _on_restart_game_pressed() -> void:
	get_tree().reload_current_scene()
	get_tree().paused = false
	%GameOver.visible = false


func _on_tree_spawn_timer_timeout() -> void:
	spawn_tree()
