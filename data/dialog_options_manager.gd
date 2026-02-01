class_name DialogOptionsManager

var _available_lines: Dictionary[Mask.MaskType, Array]

static func create() -> DialogOptionsManager:
	var dom = DialogOptionsManager.new()
	for i in range(Mask.N_MASK_TYPES):
		var mask_type = i as Mask.MaskType
		dom._available_lines[mask_type] = []
	return dom

func add_options(options: Dictionary):
	for mask_type in options.keys():
		if options[mask_type] is String:
			_available_lines[mask_type].append(options[mask_type])
		elif options[mask_type] is Array:
			_available_lines[mask_type].append_array(options[mask_type])

func select_dialog_line(mask_type: Mask.MaskType) -> String:
	return _available_lines[mask_type].pick_random()
