extends Resource

class_name HealthManager

static func calculate_new_health(player_mask: Mask.MaskType, enemy_mask: Mask.MaskType) -> void:
	var damage = Mask.calculate_damage(player_mask, enemy_mask)
	GState.health += damage
	print(
		Mask.MaskType.keys()[player_mask], " vs ", Mask.MaskType.keys()[enemy_mask], " : ", damage
	)
