class_name Opponent
extends PanelContainer

@onready var dialog_manager: DialogManager = $DialogManager
var chosen_mask: Mask.MaskType

var _dialogOptionsManager: DialogOptionsManager
var _available_masks: Array[Mask.MaskType] = [
	Mask.MaskType.Embarass,
	Mask.MaskType.ConfidentLie,
	Mask.MaskType.Facts,
	Mask.MaskType.Rage,
	Mask.MaskType.Insult,
	Mask.MaskType.BrownNosing,
	Mask.MaskType.EmotionalManipulation,
	Mask.MaskType.ShiftTheBlame,
	Mask.MaskType.CallInSick
]

func _ready() -> void:
	_dialogOptionsManager = DialogOptionsManager.create()
	_dialogOptionsManager.add_options(Dialogs.idea_guy)
	_dialogOptionsManager.add_options(Dialogs.hr_manager)

	# Make idea guy more likely to insult (4 out of 12 items in the array are Insult, so pick_random is more likely to pick that one)
	#_available_masks.append(Mask.MaskType.Insult)
	#_available_masks.append(Mask.MaskType.Insult)
	#_available_masks.append(Mask.MaskType.Insult)

func hide_dialog():
	dialog_manager.interrupt_dialogue()

func say_something() -> void:
	chosen_mask = _available_masks.pick_random()
	var dialog_line = _dialogOptionsManager.select_dialog_line(chosen_mask)
	print(Mask.MaskType.keys()[chosen_mask], ": ", dialog_line)
	var array: Array[String] = [dialog_line]
	dialog_manager.start_dialog(array)
