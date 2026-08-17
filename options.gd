extends Control

func click_sound():
	var click = Global.get_node("click moment")
	click.play()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_back_pressed() -> void:
	click_sound()
	$"../Title Screen".visible = true
	hide()


func _on_volume_slider_changed() -> void:
	pass # Replace with function body.
