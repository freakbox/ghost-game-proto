class_name HealthComponent
extends Node

@export var max_health: int = 100
@export var health: int = 0: set = on_health_set
@export var start_max_health: bool = true

signal health_depleted
signal health_changed(new_value: int)

func _init() -> void:
	setup_stats.call_deferred()


func setup_stats() -> void:
	if start_max_health:
		health = max_health


func on_health_set(value: int) -> void:
	health = value
	health_changed.emit(value)
	if health <= 0:
		health_depleted.emit()
