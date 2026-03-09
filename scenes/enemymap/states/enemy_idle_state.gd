class_name EnemyIdleState
extends EnemyState

func physics_update(delta: float) -> void:
	if enemy.ray_cast_2d_switch.is_colliding():
		print('aaaaaaa')
		
	
	if enemy.ray_cast_2d.is_colliding():
		enemy._player = enemy.ray_cast_2d.get_collider()
		finished.emit(EnemyState.CHASING)
		
	else:
		enemy.ray_cast_2d.rotate(delta * 5)
		enemy.ray_cast_2d_switch.rotate(delta * 5)
