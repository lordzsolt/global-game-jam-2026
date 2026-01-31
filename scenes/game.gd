extends Control

func _ready() -> void:
	GState.draggable_mask = %draggedMask

	%mask0.mask = GState.inventory[0]
	%mask1.mask = GState.inventory[1]
	%mask2.mask = GState.inventory[2]
	%mask3.mask = GState.inventory[3]
	%mask4.mask = GState.inventory[4]
