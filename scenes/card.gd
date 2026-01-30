extends PanelContainer

var is_dragging := false
var drag_offset := Vector2.ZERO
var original_parent: Node = null
var original_index: int = -1

func _ready() -> void:
	gui_input.connect(_on_gui_input)

func _process(_delta: float) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		global_position = get_global_mouse_position() + drag_offset
	else:
		_stop_drag()

func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				_start_drag(event.global_position)

func _start_drag(mouse_pos: Vector2) -> void:
	is_dragging = true
	drag_offset = global_position - mouse_pos

	# Store original parent info for potential restoration
	original_parent = get_parent()
	original_index = get_index()

	# Reparent to root so it's not constrained by HBoxContainer layout
	var root = get_tree().root.get_child(0)
	var global_pos = global_position
	original_parent.remove_child(self)
	root.add_child(self)
	global_position = global_pos

	# Make sure it renders on top
	z_index = 100

func _stop_drag() -> void:
	is_dragging = false
	z_index = 0
