extends Button

@export var bar: HSlider

func _pressed() -> void:
	GState.health += 0.1
