extends Resource
class_name Mask

const N_MASK_TYPES := 9
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

const ADV_BY_DISTANCE := {
	0: 1.0,
	1: 2.0,
	2: 1.5,
	3: 1.25,
	4: 1.0
}
const DISADV_BY_DISTANCE := {
	0: 1.0,
	1: 0.0,
	2: 0.75,
	3: 0.85,
	4: 1.0
}

@export var name: String = ""
@export var description: String = ""
@export var damage: float = 1.0
@export var icon: Texture2D
@export var maskType: MaskType

static func signed_ring_distance(attacker: MaskType, defender: MaskType, n: int = N_MASK_TYPES) -> int:
	var half = n / 2
	return int(posmod(defender - attacker + half, n)) - half

#func calc_damage_dealt(enemyDefense: float) -> float:
#	return damage - enemyDefense

static func calc_damage_multiplier(enemyMask: MaskType, playerMask: MaskType) -> float:
	var dist = signed_ring_distance(enemyMask, playerMask)
	
	if(dist > 0):
		return float(ADV_BY_DISTANCE.get(abs(dist), 1.0))
	elif(dist < 0):
		return float(DISADV_BY_DISTANCE.get(abs(dist), 1.0))
	else:
		return 1.0

func calc_damage_dealt(enemyMask: MaskType) -> float:
	var multiplier = calc_damage_multiplier(enemyMask, maskType)
	
	return damage * multiplier

# Prints out the damage matrix
# Rows = attacker, Columns = defender
static func print_multiplier_matrix() -> void:
	var header = "att\\def |"
	for def in range(N_MASK_TYPES):
		header += " %6d" % def
	print(header)
	print("-".repeat(header.length()))
	
	for att in range(N_MASK_TYPES):
		var line = "%7d |" % att
		for def in range(N_MASK_TYPES):
			line += " %6.2f" % calc_damage_multiplier(att, def)
		print(line)
