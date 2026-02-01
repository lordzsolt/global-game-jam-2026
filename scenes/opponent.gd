extends PanelContainer

@onready var dialog_manager: Control = $DialogManager
@onready var player: PanelContainer = $"../Player"

func _ready() -> void:
	player.testSignal.connect(testDisplay)
	

func testDisplay():
	var array: Array[String] = ["Hehe I can talk too, now what.", "Ah yeah Im always angry I forgor >:(", "or actually uhm, Im the ideas guy so I always call in sick bye u won"]
	dialog_manager.start_dialog(array)
