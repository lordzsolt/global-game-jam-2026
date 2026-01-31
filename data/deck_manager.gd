extends Node

func start_round():
	GState.deck.clear()
	GState.inventory.clear()

	for mask_type in GState.available_masks:
		GState.deck.append(mask_type)
		GState.deck.append(mask_type)

	GState.deck.shuffle()

	for i in range(GState.inventory_size):
		GState.inventory.append(GState.deck.pop_back())

	print_state()

func draw():
	while GState.inventory.size() < GState.inventory_size:
		var card = draw_one_card()
		GState.inventory.append(card)

	print_state()

func draw_one_card() -> Mask.MaskType:
	if GState.deck.is_empty():
		GState.deck = GState.discard_pile.duplicate()
		GState.discard_pile.clear()
		GState.deck.shuffle()

	return GState.deck.pop_back()

func play_card(index: int):
	var card = GState.inventory[index]
	GState.inventory.remove_at(index)
	GState.discard_pile.append(card)

	draw()

func print_state():
	print("Inventory: ", GState.inventory)
	print("Deck: ", GState.deck)
	print("Discard pile: ", GState.discard_pile)
