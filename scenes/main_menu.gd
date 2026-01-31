extends Control

@onready var mute_cb: CheckBox = $VBoxContainer2/VBoxContainer/HBoxContainer/MuteSoundCheckbox
@onready var volume_slider: HSlider = $VBoxContainer2/VBoxContainer/HBoxContainer/VolumeSlider

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Mask.print_multiplier_matrix()
	
	var health = 0.0
	
	var playerCard = Mask.new()
	playerCard.maskType = Mask.MaskType.Embarassment
	var enemyCard = Mask.new()
	enemyCard.maskType = Mask.MaskType.ConfidentLie
	
	var playerDamage = Mask.calc_damage_dealt(enemyCard.maskType, playerCard.maskType)
	var enemyDamage = Mask.calc_damage_dealt(playerCard.maskType, enemyCard.maskType)
	
	health -= playerDamage - enemyDamage
	print("playerDamage: {0}; enemyDamage: {1}; health: {2}".format([playerDamage, enemyDamage, health]))
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_pressed() -> void:
	#print("'Start Game' pressed")
	#get_tree().change_scene_to_file("res://scenes/game.tscn")
	SceneTransition.change_scene("res://scenes/game.tscn")


func _on_exit_game_button_pressed() -> void:
	get_tree().quit()


func _on_mute_sound_checkbox_toggled(toggled_on: bool) -> void:
	volume_slider.editable = !toggled_on


func _on_volume_slider_value_changed(value: float) -> void:
	print("Volume Slider changed: {0}".format([value]))
