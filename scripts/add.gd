extends Button

@export var bar: HSlider

func _pressed() -> void:
	bar.internalDummyValue = bar.value + 0.1
	
	print("Button Global Pos:" + str(global_position))
	#bar.internalDummyValue = bar.value + 0.1
	#bar.update()
	GState.health += 0.1
