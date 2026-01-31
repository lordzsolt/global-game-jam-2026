extends HSlider

@onready var internalDummyValue : float = 0.5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#Put here sth like player.conversationLevelChanged.connect(update)
	update()


func update() -> void:
	value = internalDummyValue #dummy value, actually put here sth like "player.conversationLevel"

#Dummy function
func updateWith(newValue : float) -> void:
	value = newValue
