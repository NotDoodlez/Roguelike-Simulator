extends Control

@onready var click = $"click sound"

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


func testEsc():
	if Input.is_action_just_pressed("escape") and get_tree().paused == false:
		pause()
	elif Input.is_action_just_pressed("escape") and get_tree().paused == true:
		resume()


func _on_resume_pressed() -> void:
	resume()


func _on_restart_pressed() -> void:
	resume()
	get_tree().reload_current_scene()


func _on_main_menu_pressed() -> void:
	get_tree().paused = false
	await get_tree().create_timer(0.1).timeout
	get_tree().change_scene_to_file("res://Main_Menu.tscn")


func _process(delta: float) -> void:
	testEsc()
