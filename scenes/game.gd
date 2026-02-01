extends Control

const CardScene = preload("res://scenes/card.tscn")
@onready var opponent: Opponent = %Opponent
@onready var player: Player = %Player

var cards: Array[Card] = []

func _ready() -> void:
	GState.draggable_mask = %draggedMask
	DeckManager.start_round()

	# Create card instances dynamically
	for i in range(GState.inventory_size):
		var card = CardScene.instantiate()
		%masksContainer.add_child(card)
		cards.append(card)

	player.dialog_finished.connect(handle_turn_end)

	# Start turn after 1 second delay
	get_tree().create_timer(1.0).timeout.connect(start_turn)


func _process(_delta: float) -> void:
	if GState.is_dragging:
		return

	for i in range(GState.inventory.size()):
		var card = cards[i]
		card.maskType = GState.inventory[i]
		card.index = i

func start_turn() -> void:
	player.hide_dialog()
	opponent.say_something()

func handle_turn_end() -> void:
	# Show some text of what happened
	# Delay 1 second
	# Advnace turn

	HealthManager.calculate_new_health(player.chosen_mask, opponent.chosen_mask)

	get_tree().create_timer(2.0).timeout.connect(start_turn)
