extends Node

func _ready() -> void:
	for i in range(Mask.N_MASK_TYPES):
		var mask_type = i as Mask.MaskType
		GState.available_lines[mask_type] = []

func add_options(options: Dictionary):
	for mask_type in options.keys():
		if options[mask_type] is String:
			GState.available_lines[mask_type].append(options[mask_type])
		elif options[mask_type] is Array:
			GState.available_lines[mask_type].append_array(options[mask_type])

func select_dialog_line(mask_type: Mask.MaskType) -> String:
	return GState.available_lines[mask_type].pick_random()
