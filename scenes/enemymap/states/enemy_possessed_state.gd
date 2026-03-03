class_name EnemyPossessdState
extends EnemyState

func physics_update(delta: float) -> void:
	if not enemy._ghost:
		finished.emit(IDLE)
