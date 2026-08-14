extends Control

func click_sound():
	var click = Global.get_node("click moment")
	click.play()
	await get_tree().create_timer(3.0).timeout


func _ready() -> void:
	$AnimationPlayer.play("RESET")
	hide()

func resume():
	get_tree().paused = false
	$AnimationPlayer.play_backwards("blur")

func pause():
	get_tree().paused = true
	$AnimationPlayer.play("blur")
	show()


func _on_player_health_depleted() -> void:
	pause()
	show()

func _on_resume_pressed() -> void:
	resume()


func _on_restart_pressed() -> void:
	click_sound()
	resume()
	get_tree().reload_current_scene()


func _on_main_menu_pressed() -> void:
	click_sound()
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Main_Menu.tscn")


# func _process(delta: float) -> void:
	# _on_player_health_depleted()


func _on_quit_game_pressed() -> void:
	get_tree().paused = false
	click_sound()
	get_tree().quit()
