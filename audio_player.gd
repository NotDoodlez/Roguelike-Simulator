extends AudioStreamPlayer2D

const mainmenubg = preload("res://Sounds/Week 18 - Distant Skyline NIGHT DRIVE.ogg")
const ingamebg = preload("res://Sounds/Week 15 - Sunburn SPF 3000.ogg")


func _play_music(music: AudioStream, volume = volume_db):
	if stream == music:
		return
	
	stream = music
	volume_db = volume
	play()

func play_menubg():
	_play_music(mainmenubg)

func play_ingamebg():
	_play_music(ingamebg)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
