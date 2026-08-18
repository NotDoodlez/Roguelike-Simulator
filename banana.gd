extends Area2D

@onready var heal_amount:int = 20

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(potassium)

func potassium(body: Node2D) -> void:
	if "player" in body.name.to_lower():
		body.health += heal_amount
		if body.health >= 100:
			body.health = 100
		queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
