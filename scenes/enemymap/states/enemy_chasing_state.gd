class_name EnemyChasingState
extends EnemyState


func physics_update(_delta: float) -> void:
	# Direction from this character to the target
	var direction := (enemy._player.global_position - enemy.global_position).normalized()

	# Move towards the target
	enemy.velocity = direction * enemy.speed
