class_name DestroyWhenHealthDepletedComponent
extends Node

@export var actor: Node2D
@export var health_component: HealthComponent
@export var delay: float = 0
@export var hurtbox: HurtboxComponent

func _ready() -> void:
	health_component.health_depleted.connect(destroy_object)
	health_component.health_depleted.connect(deactivate_hurtbox)


func destroy_object() -> void:
	if delay > 0:
		await get_tree().create_timer(delay).timeout
	actor.call_deferred("queue_free")


func deactivate_hurtbox() -> void:
	if hurtbox:
		hurtbox.is_invincible = true
