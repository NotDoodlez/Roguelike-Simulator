extends Control

@onready var bg_music = $"Main Menu background music"
@onready var click = $"click sound"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bg_music.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_play_game_pressed() -> void:
	click.play()
	await get_tree().create_timer(0.1).timeout
	get_tree().change_scene_to_file("res://Game.tscn")

func _on_options_pressed() -> void:
	click.play()
	await get_tree().create_timer(0.1).timeout
	pass # Replace with function body.


func _on_quit_game_pressed() -> void:
	click.play()
	await get_tree().create_timer(0.1).timeout
	get_tree().quit()


func _on_credits_pressed() -> void:
	click.play()
	await get_tree().create_timer(0.1).timeout
	pass # Replace with function body.
