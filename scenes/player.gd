extends PanelContainer

@onready var dialog_manager: Control = $DialogManager


func _input(_event: InputEvent) -> void:
	if !Input.is_action_just_released("mouse_left"):
		return

	if GState.draggable_mask == null:
		return

	var mouse_pos = get_global_mouse_position()
	var rect = Rect2(%maskArea.global_position, %maskArea.size)


	if rect.has_point(mouse_pos):
		var mask_type = GState.draggable_mask.maskType

		%maskTexture.texture = Mask.worn_icon(mask_type)
		%maskTexture.visible = true
		DeckManager.play_card(GState.draggable_mask.index)

		var dialog_line = DialogOptionsManager.select_dialog_line(mask_type)
		print(Mask.MaskType.keys()[mask_type], ": ", dialog_line)
		dialog_manager.start_dialog([dialog_line])

	GState.draggable_mask.visible = false
	GState.draggable_mask.maskType = -1
