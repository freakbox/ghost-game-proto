class_name GhostControllingState
extends GhostState


func physics_update(delta: float) -> void:
	if not ghost._enemy_possessed:
		finished.emit(RETURNING)
		return
	
	ghost.global_position = ghost._enemy_possessed.global_position
	
	if Input.is_action_just_pressed("ghost_shot"):
		finished.emit(RETURNING)
	

func exit() -> void:
	ghost._enemy_possessed.release_ghost()
	ghost._enemy_possessed = null
