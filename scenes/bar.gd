extends HSlider


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#Put here sth like player.conversationLevelChanged.connect(update)
	update()



func update() -> void:
	value = 50 #dummy value, actually put here sth like "player.conversationLevel"
