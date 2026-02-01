class_name TextBox
extends MarginContainer

@export var align_to_right: bool

@onready var label: Label = $MarginContainer/Label
@onready var timer: Timer = $LetterDisplayTimer

const MAX_WIDTH = 512

var text : String = ""
var letter_index : int = 0

var letter_time: float = 0.03
var space_time : float = 0.06
var punctuation_time : float = 0.2

signal finished_displaying()


func display_text(text_to_display: String) -> void:
	#Realign to bottom left:
	global_position.y -= size.y



	text = text_to_display
	label.text = text_to_display

	await resized # wait for x to resize
	custom_minimum_size.x = min(size.x, MAX_WIDTH)

	if size.x > MAX_WIDTH:
		label.autowrap_mode = TextServer.AUTOWRAP_WORD
		await resized # wait for x to resize
		await resized # wait for y to resize
		custom_minimum_size.y = size.y

	if align_to_right:
		#Align to bottom right instead
		global_position.x -= size.x

	label.text = ""
	_display_letter()

func _display_letter() -> void:
	label.text += text[letter_index]

	letter_index += 1
	if letter_index >= text.length():
		finished_displaying.emit()
		return

	match text[letter_index]:
		"!", "?", ".", ",":
			timer.start(punctuation_time)
		" ":
			timer.start(space_time)
		_:
			timer.start(letter_time)


func _on_letter_display_timer_timeout() -> void:
	_display_letter()
