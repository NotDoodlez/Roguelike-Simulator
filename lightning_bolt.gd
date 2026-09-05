extends Area2D

@export var speed_boost_amount: float = 300.0
@export var boost_duration: float = 4.0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D) -> void:
	if "player" in body.name.to_lower():
		if "speed" in body:
			apply_boost(body, "speed")
		else:
			queue_free()

func apply_boost(player_node: Node2D, variable_name: String):
	var original_speed = player_node.get(variable_name)
	player_node.set(variable_name, original_speed + speed_boost_amount)
	
	visible = false
	set_deferred("monitoring", false)
	
	await get_tree().create_timer(boost_duration).timeout
	
	if is_instance_valid(player_node):
		player_node.set(variable_name, original_speed)
		
	queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
