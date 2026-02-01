class_name Mask

const N_MASK_TYPES := 9
enum MaskType {
	Embarass,
	ConfidentLie, # Sales Expert
	Facts, # Interviewer
	Rage,
	Insult, # CEO
	BrownNosing,
	EmotionalManipulation, # HR Manager
	ShiftTheBlame,
	CallInSick # Idea Guy
}

const DAMAGE_BY_DISTANCE := [
	0.0,
	2.0,
	1.0,
	0.5,
	0.25,
	-0.25,
	-0.5,
	-1.0,
	-2.0,
]


static func icon(maskType: Mask.MaskType) -> Texture2D:
	match maskType:
		MaskType.EmotionalManipulation:
			return GResource.emotionalManipulationTexture
		MaskType.Embarass:
			return GResource.embarassmentTexture
		MaskType.ConfidentLie:
			return GResource.confidentLieTexture
		MaskType.Facts:
			return GResource.factsTexture
		MaskType.ShiftTheBlame:
			return GResource.shiftTheBlameTexture
		MaskType.CallInSick:
			return GResource.callInSickTexture
		MaskType.BrownNosing:
			return GResource.brownNosingTexture
		MaskType.Insult:
			return GResource.insultTexture
		MaskType.Rage:
			return GResource.rageTexture
		_:
			return null

static func worn_icon(maskType: MaskType) -> Texture2D:
	match maskType:
		MaskType.EmotionalManipulation:
			return GResource.worn_emotionalManipulationTexture
		MaskType.Embarass:
			return GResource.worn_embarassmentTexture
		MaskType.ConfidentLie:
			return GResource.worn_confidentLieTexture
		MaskType.Facts:
			return GResource.worn_factsTexture
		MaskType.ShiftTheBlame:
			return GResource.worn_shiftTheBlameTexture
		MaskType.CallInSick:
			return GResource.worn_callInSickTexture
		MaskType.BrownNosing:
			return GResource.worn_brownNosingTexture
		MaskType.Insult:
			return GResource.worn_insultTexture
		MaskType.Rage:
			return GResource.worn_rageTexture
		_:
			return null

static func calculate_damage(enemyMask: MaskType, playerMask: MaskType) -> float:
	var distance = abs(enemyMask - playerMask)
	return DAMAGE_BY_DISTANCE[distance]


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
			line += " %6.2f" % calculate_damage(att, def)
		print(line)
