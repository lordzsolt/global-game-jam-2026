extends Resource

class_name HealthManager

static func calculate_new_health(playerCard: Mask.MaskType, enemyCard: Mask.MaskType) -> void:
	var playerDamage = Mask.calculate_damage(enemyCard, playerCard)
	var enemyDamage = Mask.calculate_damage(playerCard, enemyCard)

	GState.health -= playerDamage - enemyDamage

	print("playerDamage: {0}; enemyDamage: {1}; health: {2}".format([playerDamage, enemyDamage, GState.health]))
