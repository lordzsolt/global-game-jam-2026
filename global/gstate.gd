extends Node

# TODO: Change this
var health: float = 0.0
var draggable_mask: Card

var inventory: Array[Mask] = [
	Mask.create(Mask.MaskType.EmotionalManipulation),
	Mask.create(Mask.MaskType.EmotionalManipulation),
	Mask.create(Mask.MaskType.EmotionalManipulation),
	Mask.create(Mask.MaskType.EmotionalManipulation),
	Mask.create(Mask.MaskType.EmotionalManipulation),
]
