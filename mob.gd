extends CharacterBody2D

var health = 3


 
@onready var player = get_node("/root/Game/Player")


func _ready() -> void:
	%Slime.play_walk()

	

func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity=direction * 300.0
	move_and_slide()


func take_damage():
	health -= 1
	%Slime.play_hurt()
	
	if health == 0:
		queue_free()
		ScoreCounter.add_point()
		const SMOKE_SCENE = preload("res://smoke_explosion/smoke_explosion.tscn")
		var smoke = SMOKE_SCENE.instantiate()
		get_parent().add_child(smoke)
		smoke.global_position = global_position
		var drop_roll = randf()
		if drop_roll <= 0.5:
			spawn_banana()
		

func spawn_banana() -> void:
	const BANANA_SCENE = preload("res://banana.tscn")
	var new_banana = BANANA_SCENE.instantiate()
	
	new_banana.global_position = global_position
	get_tree().root.add_child(new_banana)
