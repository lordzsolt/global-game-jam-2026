class_name Player
extends PanelContainer

signal dialog_finished
signal dialog_started

@onready var mask_equip_sound: AudioStreamPlayer = $MaskEquipSound

@onready var dialog_manager: DialogManager = $DialogManager
var _dialog_option_manager: DialogOptionsManager
var chosen_mask: Mask.MaskType

func _ready() -> void:
	%maskTexture.visible = false

	_dialog_option_manager = DialogOptionsManager.create()
	_dialog_option_manager.add_options(Dialogs.job_interview)
	_dialog_option_manager.add_options(Dialogs.sales_expert)

	dialog_manager.text_finished.connect(func():
		dialog_finished.emit()
	)

func _input(_event: InputEvent) -> void:
	if !Input.is_action_just_released("mouse_left"):
		return

	if GState.draggable_mask == null || GState.draggable_mask.maskType == -1:
		return

	var mouse_pos = get_global_mouse_position()
	var rect = Rect2(%maskArea.global_position, %maskArea.size)

	if rect.has_point(mouse_pos):
		chosen_mask = GState.draggable_mask.maskType

		%maskTexture.texture = Mask.worn_icon(chosen_mask)
		%maskTexture.visible = true
		DeckManager.play_card(GState.draggable_mask.index)
		mask_equip_sound.play()

		# Get dialogue line
		var dialog_line = _dialog_option_manager.select_dialog_line(chosen_mask)
		print(Mask.MaskType.keys()[chosen_mask], ": ", dialog_line)

		# Display it
		dialog_manager.interrupt_dialogue()
		var array: Array[String] = [dialog_line]
		dialog_manager.start_dialog(array)
		dialog_started.emit()

		GState.draggable_mask.maskType = -1

	GState.draggable_mask.visible = false
	GState.is_dragging = false


func hide_dialog():
	dialog_manager.interrupt_dialogue()
