class_name GhostAttackingState
extends GhostState

@export var attack_time: float = 1
var _current_attack_time: float
var _direction: Vector2

func enter(previous_state_path: String, data := {}) -> void:
	_current_attack_time = attack_time
	_direction = ghost.player.face_direction
	ghost._attacking = true


func physics_update(delta: float) -> void:
	if ghost._enemy_possessed:
		finished.emit(CONTROLLING)
	else:
		ghost.position += _direction * delta * ghost.attack_velocity
		_current_attack_time -= delta
		
		if Input.is_action_just_pressed("ghost_shot"):
			_current_attack_time = 0
		
		if _current_attack_time <= 0:
			finished.emit(RETURNING)


func exit() -> void:
	ghost._attacking = false
