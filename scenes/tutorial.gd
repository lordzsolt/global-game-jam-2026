extends Control

var can_proceed = false

func _ready() -> void:
	get_tree().create_timer(3.0).timeout.connect(
		func():
			$Label.visible = true
			can_proceed = true
	)

func _input(event: InputEvent) -> void:
	if !can_proceed:
		return

	if Input.is_action_just_pressed("mouse_left"):
		SceneTransition.change_scene("res://scenes/game.tscn")
