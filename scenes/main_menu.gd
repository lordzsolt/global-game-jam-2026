extends Control

@onready var mute_cb: CheckBox = $VBoxContainer2/VBoxContainer/HBoxContainer/MuteSoundCheckbox
@onready var volume_slider: HSlider = $VBoxContainer2/VBoxContainer/HBoxContainer/VolumeSlider

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	STransition.instance = preload("res://scenes/scene_transition.tscn").instantiate()

	DeckManager.instance = DeckManager.new()

	Mask.print_multiplier_matrix()

	var playerCard = Mask.new()
	playerCard.maskType = Mask.MaskType.Embarass
	var enemyCard = Mask.new()
	enemyCard.maskType = Mask.MaskType.ConfidentLie

	HealthManager.calculate_new_health(playerCard, enemyCard)

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_pressed() -> void:
	#print("'Start Game' pressed")
	#get_tree().change_scene_to_file("res://scenes/game.tscn")
	STransition.instance.change_scene("res://scenes/game.tscn")


func _on_exit_game_button_pressed() -> void:
	get_tree().quit()


func _on_mute_sound_checkbox_toggled(toggled_on: bool) -> void:
	volume_slider.editable = !toggled_on


func _on_volume_slider_value_changed(value: float) -> void:
	print("Volume Slider changed: {0}".format([value]))
