class_name GhostReturningState
extends GhostState

var _direction: Vector2


func physics_update(delta: float) -> void:
	_direction = ghost.global_position.direction_to(ghost.player.global_position)
	ghost.position += _direction * delta * ghost.return_velocity
	
	if ghost.global_position.distance_to(ghost.player.global_position) < 5:
		finished.emit(IDLE)
