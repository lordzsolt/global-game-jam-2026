extends Node

var is_dragging: bool

var inventory_size = 5

# TODO: Change this
var health: float = 0.0
var draggable_mask: Card

# How many of each mask should the player have?
var nr_each_mask = 1

var available_masks: Array[Mask.MaskType] = [
	Mask.MaskType.Embarass,
	Mask.MaskType.Rage,
	Mask.MaskType.BrownNosing,
	Mask.MaskType.ShiftTheBlame,

	# Should be unlockable
	Mask.MaskType.ConfidentLie,
	Mask.MaskType.Facts,
	Mask.MaskType.Insult,
	Mask.MaskType.EmotionalManipulation,
	Mask.MaskType.CallInSick,
]

var inventory: Array[Mask.MaskType] = []
var deck: Array[Mask.MaskType] = []
var discard_pile: Array[Mask.MaskType] = []
