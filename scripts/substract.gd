extends Button

@export var bar: HSlider

func _pressed() -> void:
	bar.internalDummyValue = bar.value - 0.1
	bar.update()
