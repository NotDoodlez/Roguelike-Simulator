extends Control

func click_sound():
	var click = Global.get_node("click moment")
	click.play()
	await get_tree().create_timer(0.1).timeout


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_back_pressed() -> void:
	click_sound()
	hide()
	$"../Title Screen".visible = true


func _on_credits_pressed() -> void:
	click_sound()
	show()
	$"../Title Screen".visible = false
