extends Label

func add_point():
	Points.points += 1
	text = "Score: " + str(Points.points)
	print("Score: " + str(Points.points))


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	text = "Score: " + str(Points.points)	
