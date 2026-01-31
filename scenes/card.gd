class_name Card # TODO: Rename this to InventoryMask
extends AltAspectRatioContainer

var maskType: Mask.MaskType = -1
var index: int

var is_dragging := false
var drag_offset := Vector2.ZERO
var original_parent: Node = null

func _ready() -> void:
	gui_input.connect(_on_gui_input)

func _process(_delta: float) -> void:
	if is_dragging || maskType == -1:
		%maskTextureRect.texture = null
		%label.text = ""
	else:
		%maskTextureRect.texture = Mask.icon(maskType)
		%label.text = str(maskType)

	if !is_dragging:
		return
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		GState.draggable_mask.global_position = get_global_mouse_position() + drag_offset - size / 2
	else:
		_stop_drag()

func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				_start_drag()

func _start_drag() -> void:
	is_dragging = true

	GState.draggable_mask.global_position = global_position
	GState.draggable_mask.maskType = maskType
	GState.draggable_mask.index = index
	GState.draggable_mask.visible = true

	return

func _stop_drag() -> void:
	is_dragging = false
