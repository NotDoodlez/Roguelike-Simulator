extends Control

@onready var points_label: Label = $Points
@onready var pistol_button: Button = $Pistol/Pistol_button
@onready var shotgun_button: Button = $Shotgun/Shotgun_button
@onready var upgrade_button: Button = $Upgrade

func click_sound():
	var click = Global.get_node("click moment")
	click.play()
	await get_tree().create_timer(0.1).timeout


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_shop_ui()

func update_shop_ui():
	if points_label:
		points_label.text = "Points: " + str(Points.points)
	
	if Points.equipped_weapon == "Pistol":
		pistol_button.text = "Equipped"
		pistol_button.disabled = true
	else:
		pistol_button.text = "Equip"
		pistol_button.disabled = false
	
	if "Shotgun" in Points.unlocked_weapon:
		if Points.equipped_weapon == "Shotgun":
			shotgun_button.text = "Equipped"
			shotgun_button.disabled = true
		else:
			shotgun_button.text = "Equip"
			shotgun_button.disabled = false
			
		upgrade_button.visible=true
		if Points.shotgun_upgraded:
			upgrade_button.text = "Max Upgraded"
			upgrade_button.disabled = true
		else:
			upgrade_button.text = "Upgrade (100 pts)"
			upgrade_button.disabled = false
	else:
		upgrade_button.visible = false





# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_back_pressed() -> void:
	click_sound()
	$"../Title Screen".visible = true
	hide()


func _on_shotgun_button_pressed() -> void:
	click_sound()
	if "Shotgun" in Points.unlocked_weapon:
		Points.equipped_weapon = "Shotgun"
	else:
		if Points.points >= 50:
			Points.points -= 50
			Points.unlocked_weapon.append("Shotgun")
			Points.equipped_weapon = "Shotgun"
		else:
			print ("No points bhai")
			return
	
	update_shop_ui()


func _on_pistol_button_pressed() -> void:
	Points.equipped_weapon = "Pistol"
	click_sound()
	update_shop_ui()


func _on_upgrade_pressed() -> void:
	if not Points.shotgun_upgraded and Points.points >=100:
		Points.points -= 100
		Points.shotgun_upgraded = true
		update_shop_ui()
	else:
		print("you cant upgrade lol loser")
