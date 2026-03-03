class_name GhostIdleState
extends GhostState

func enter(previous_state_path: String, data := {}) -> void:
	pass


func physics_update(_delta: float) -> void:
	if ghost.player:
		ghost.global_position.x = ghost.player.global_position.x + 13
		ghost.global_position.y = ghost.player.global_position.y
	
	if Input.is_action_just_pressed("ghost_shot"):
		if ghost.player:
			ghost.global_position = ghost.player.global_position
			finished.emit(ATTACKING)
