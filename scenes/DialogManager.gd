class_name DialogManager
extends Node

signal text_finished

@export var text_box_scene: PackedScene

# Places the speech bubble.
@onready var speech_bubble_point: Panel = $SpeechBubblePoint


var dialog_lines: Array[String] = []
var current_lin_index = 0

var text_box
var text_box_position: Vector2

@export var sfx: AudioStream  

var is_dialog_active = false
var can_advance_line = false

func start_dialog(lines: Array[String]) -> void:
	if is_dialog_active:
		return #One DialogManager only does one Dialog at a time

	dialog_lines = lines
	text_box_position = speech_bubble_point.global_position
	_show_text_box()

	is_dialog_active = true


func _show_text_box():
	text_box = text_box_scene.instantiate()
	text_box.finished_displaying.connect(_on_text_box_finished_displaying)
	get_tree().root.add_child(text_box)
	text_box.global_position = text_box_position
	text_box.display_text(dialog_lines[current_lin_index], sfx)
	can_advance_line = false

func _on_text_box_finished_displaying():
	can_advance_line = true
	text_finished.emit()

func _unhandled_input(event):
	if(
		event.is_action_pressed("advance_dialog") &&
		is_dialog_active &&
		can_advance_line
	):
		text_box.queue_free()

		current_lin_index += 1
		if current_lin_index >= dialog_lines.size():
			is_dialog_active = false
			current_lin_index = 0
			return

		_show_text_box()

func interrupt_dialogue():
	if text_box != null:
		text_box.queue_free()
	is_dialog_active = false
	current_lin_index = 0
