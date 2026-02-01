extends Control

@onready var mute_cb: CheckBox = $VBoxContainer2/VBoxContainer/HBoxContainer/MuteSoundCheckbox
@onready var volume_slider: HSlider = $VBoxContainer2/VBoxContainer/HBoxContainer/VolumeSlider

const bus_name := "Master"
var bus_idx: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bus_idx = AudioServer.get_bus_index(bus_name)
	
	#STransition.instance = preload("res://scenes/scene_transition.tscn").instantiate()
	Mask.print_multiplier_matrix()
	
	_sync_ui_to_audio()

	if Config.debug_skip_menu:
		call_deferred("_skip_main_menu")

func _skip_main_menu():
	get_tree().change_scene_to_file("res://scenes/game.tscn")

func _sync_ui_to_audio() -> void:
	var is_muted = AudioServer.is_bus_mute(bus_idx)
	mute_cb.button_pressed = is_muted
	
	volume_slider.editable = !is_muted
	
	var db = AudioServer.get_bus_volume_db(bus_idx)
	volume_slider.value = db_to_linear(db)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_pressed() -> void:
	SceneTransition.change_scene("res://scenes/game.tscn")


func _on_exit_game_button_pressed() -> void:
	get_tree().quit()


func _on_mute_sound_checkbox_toggled(toggled_on: bool) -> void:
	AudioServer.set_bus_mute(bus_idx, toggled_on)
	volume_slider.editable = !toggled_on


func _on_volume_slider_value_changed(value: float) -> void:
	#print("Volume Slider changed: {0}".format([value]))
	AudioServer.set_bus_volume_db(bus_idx, linear_to_db(value))
	
