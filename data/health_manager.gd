extends Resource

class_name HealthManager

static func calculate_new_health(playerCard: Mask, enemyCard: Mask) -> void:
	var playerDamage = Mask.calc_damage_dealt(enemyCard.maskType, playerCard.maskType)
	var enemyDamage = Mask.calc_damage_dealt(playerCard.maskType, enemyCard.maskType)
	
	GState.health -= playerDamage - enemyDamage
	
	print("playerDamage: {0}; enemyDamage: {1}; health: {2}".format([playerDamage, enemyDamage, GState.health]))
	
