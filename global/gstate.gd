extends Node

var is_dragging: bool

var inventory_size = 5

# TODO: Change this
var health: float = 0.0
var draggable_mask: Card


var available_masks: Array[Mask.MaskType] = [
	Mask.MaskType.Embarass,
	Mask.MaskType.Rage,
	Mask.MaskType.BrownNosing,
	Mask.MaskType.ShiftTheBlame,
]

var inventory: Array[Mask.MaskType] = []
var deck: Array[Mask.MaskType] = []
var discard_pile: Array[Mask.MaskType] = []

var available_lines: Dictionary[Mask.MaskType, Array]
