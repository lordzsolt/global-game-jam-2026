extends HSlider


func _process(_delta: float) -> void:
	value = GState.health

#Dummy function
func updateWith(newValue : float) -> void:
	value = newValue
