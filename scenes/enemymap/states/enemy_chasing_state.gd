class_name EnemyChasingState
extends EnemyState


func physics_update(_delta: float) -> void:
	# Direction from this character to the target
	var direction = Vector2(0,0)
	#check if it is in the same room
	if enemy.current_room_index == RoomControl.player_current_room:
		direction = (enemy._player.global_position - enemy.global_position).normalized()
	else:
		if enemy.current_room_index > RoomControl.player_current_room:
			direction = (RoomControl.rooms[enemy.current_room_index - 1].global_position - enemy.global_position).normalized()
		else:
			direction = (RoomControl.rooms[enemy.current_room_index + 1].global_position - enemy.global_position).normalized()
	
	# Move towards the target
	enemy.velocity = direction * enemy.speed
	
