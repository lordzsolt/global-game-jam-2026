extends Button

@export var bar: HSlider

func _pressed() -> void:
	bar.internalDummyValue = bar.value + 0.1
	bar.update()
	
	DialogManager.start_dialog(global_position, ["Nooo!", "This hurts so much.", "Hey, why would you do this, stop it :(", "Ahhhhhhhhhhhhhhhhhhhhh I'm screaming so loooooooooong not just because I wanna see if the linebreak works nono. Tho actually Im kinda curious now what a coincidence, does it work? Orrr not? I can't really know as I'm writing this soooooo"])
	#bar.internalDummyValue = bar.value + 0.1
	#bar.update()
	GState.health += 0.1
