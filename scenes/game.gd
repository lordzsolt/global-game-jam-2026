extends Control

const CardScene = preload("res://scenes/card.tscn")

var cards: Array[Card] = []

func _ready() -> void:
	GState.draggable_mask = %draggedMask
	DeckManager.start_round()

	# Create card instances dynamically
	for i in range(GState.inventory_size):
		var card = CardScene.instantiate()
		%masksContainer.add_child(card)
		cards.append(card)

func _process(_delta: float) -> void:
	for i in range(GState.inventory.size()):
		var card = cards[i]
		card.mask = Mask.create(GState.inventory[i])
		card.index = i
