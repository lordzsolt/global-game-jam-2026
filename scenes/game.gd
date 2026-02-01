extends Control

const CardScene = preload("res://scenes/card.tscn")
@onready var opponent: Opponent = %Opponent
@onready var player: Player = %Player
@onready var turnDescriptionBox: PanelContainer = $TurnDescriptionContainer
@onready var turnDescriptionLabel: RichTextLabel = $TurnDescriptionContainer/RichTextLabel

var cards: Array[Card] = []
var can_drag: bool = false

func _ready() -> void:
	GState.draggable_mask = %draggedMask
	DeckManager.start_round()

	# Create card instances dynamically
	for i in range(GState.inventory_size):
		var card = CardScene.instantiate()
		%masksContainer.add_child(card)
		cards.append(card)

	player.dialog_started.connect(
		func():
			can_drag = false
	)

	player.dialog_finished.connect(handle_turn_end)

	opponent.dialog_manager.text_finished.connect(
		func():
			can_drag = true
	)

	# Start turn after 1 second delay
	get_tree().create_timer(1.0).timeout.connect(start_turn)



func _process(_delta: float) -> void:
	if GState.is_dragging:
		return

	for i in range(GState.inventory.size()):
		var card = cards[i]
		card.maskType = GState.inventory[i]
		card.index = i
		card.can_drag = can_drag

func start_turn() -> void:
	turnDescriptionBox.visible = false
	turnDescriptionLabel.visible = false
	player.hide_dialog()
	opponent.say_something()
	can_drag = false

func handle_turn_end() -> void:
	# Show some text of what happened
	# Delay 3 seconds
	# Advnace turn
	var oldHealth = GState.health
	HealthManager.calculate_new_health(player.chosen_mask, opponent.chosen_mask)
	var newHealth = GState.health
	var healthDiff = newHealth - oldHealth

	var effectiveness = ""

	if(healthDiff <= -2.0):
		effectiveness = "very ineffective"
	elif(healthDiff <= -1.0):
		effectiveness = "ineffective"
	elif(healthDiff <= -0.5):
		effectiveness = "somewhat ineffective"
	elif(healthDiff <= -0.25):
		effectiveness = "a little ineffective"
	elif(healthDiff <= 0):
		effectiveness = "useless"
	elif(healthDiff <= 0.25):
		effectiveness = "a little effective"
	elif(healthDiff <= 0.5):
		effectiveness = "somewhat effective"
	elif(healthDiff <= 1.0):
		effectiveness = "effective"
	elif(healthDiff <= 2.0):
		effectiveness = "very effective"

	var turnDescription = "Your
[b]{0}[/b]
was
[i]{1}[/i]
against the enemy's
[b]{2}[/b]".format([
	Mask.get_mask_name(player.chosen_mask),
	effectiveness,
	Mask.get_mask_name(opponent.chosen_mask)
])
	turnDescriptionBox.visible = true
	turnDescriptionLabel.text = turnDescription
	turnDescriptionLabel.visible = true

	if(GState.health <= -5.0):
		# We lost the game
		GState.game_won = false
		SceneTransition.change_scene("res://scenes/game_over.tscn")
	elif(GState.health >= 5.0):
		# We won the game
		GState.game_won = true
		SceneTransition.change_scene("res://scenes/game_over.tscn")

	get_tree().create_timer(3.0).timeout.connect(start_turn)
