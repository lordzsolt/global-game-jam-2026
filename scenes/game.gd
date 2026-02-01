extends Control

const CardScene = preload("res://scenes/card.tscn")

var cards: Array[Card] = []

func _ready() -> void:
	GState.draggable_mask = %draggedMask
	DeckManager.start_round()

	DialogOptionsManager.add_options(Dialogs.job_interview)
	DialogOptionsManager.add_options(Dialogs.sales_expert)

	# Create card instances dynamically
	for i in range(GState.inventory_size):
		var card = CardScene.instantiate()
		%masksContainer.add_child(card)
		cards.append(card)

func _process(_delta: float) -> void:
	if GState.is_dragging:
		return

	for i in range(GState.inventory.size()):
		var card = cards[i]
		card.maskType = GState.inventory[i]
		card.index = i
