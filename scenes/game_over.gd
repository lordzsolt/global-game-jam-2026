extends Control

@onready var winLoseRect: TextureRect = $VBoxContainer/TextureRect
@onready var retryButton: Button = $VBoxContainer/RetryButton

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if(GState.game_won):
		winLoseRect.texture = preload("res://art/ArtAssets_Clean/IfH_YouWin.png")
	else:
		winLoseRect.texture = preload("res://art/ArtAssets_Clean/IfH_YouLose.png")



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_retry_button_pressed() -> void:
	GState.game_won = false
	GState.health = 0.0
	SceneTransition.change_scene("res://scenes/game.tscn")
