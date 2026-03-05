class_name EnemyPossessdState
extends EnemyState

func enter(previous_state_path: String, data := {}) -> void:
	enemy.hurtbox_component.is_invincible = true


func physics_update(delta: float) -> void:
	if not enemy._ghost:
		print('ghost off')
		finished.emit(IDLE)


	if enemy._ghost and enemy._ghost._enemy_target and is_instance_valid(enemy._ghost._enemy_target):
		var direction := (enemy._ghost._enemy_target.global_position - enemy.global_position).normalized()

		# Move towards the target
		enemy.velocity = direction * enemy.speed


func exit() -> void:
	enemy.hurtbox_component.is_invincible = false
