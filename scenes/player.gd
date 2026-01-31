extends PanelContainer


func _input(_event: InputEvent) -> void:
	if !Input.is_action_just_released("mouse_left"):
		return

	if GState.draggable_mask == null:
		return

	var mouse_pos = get_global_mouse_position()
	var rect = Rect2(%maskArea.global_position, %maskArea.size)

	if rect.has_point(mouse_pos):
		%maskTexture.visible = true
		DeckManager.play_card(GState.draggable_mask.index)

	GState.draggable_mask.visible = false
	GState.draggable_mask.mask = null
