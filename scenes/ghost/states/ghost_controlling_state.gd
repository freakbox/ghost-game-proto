class_name GhostControllingState
extends GhostState

@export var hitbox_collision_shape: CollisionShape2D

var collision_activation_time: float = 0.2

func physics_update(delta: float) -> void:
	collision_activation_time -= delta
	if collision_activation_time <= 0:
		collision_activation_time += 0.2
		hitbox_collision_shape.disabled = not hitbox_collision_shape.disabled
	
	if not ghost._enemy_possessed:
		finished.emit(RETURNING)
		return
	
	ghost.global_position = ghost._enemy_possessed.global_position
	
	if Input.is_action_just_pressed("ghost_shot"):
		finished.emit(RETURNING)
	
	if not ghost._enemy_target and ghost.ray_cast_2d.is_colliding():
		ghost._enemy_target = ghost.ray_cast_2d.get_collider()


func exit() -> void:
	hitbox_collision_shape.disabled = true
	if ghost._enemy_possessed:
		ghost._enemy_possessed.release_ghost()
	ghost._enemy_possessed = null
