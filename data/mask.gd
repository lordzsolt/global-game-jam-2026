extends Resource
class_name Mask

enum MaskType {
	EmotionalManipulation,
	Embarassment,
	ConfidentLie,
	Facts,
	ShiftTheBlame,
	CallInSick,
	BrownNosing,
	Insult,
	Rage
}

@export var name: String = ""
@export var description: String = ""
@export var damage: float = 1.0
@export var icon: Texture2D
@export var type: MaskType

func calc_damage_dealt(enemyDefense: float) -> float:
	return damage - enemyDefense
