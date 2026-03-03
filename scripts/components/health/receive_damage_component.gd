class_name ReceiveDamageComponent
extends Node

@export var hurtbox: HurtboxComponent
@export var health_component: HealthComponent

func _ready() -> void:
	hurtbox.hurt.connect(get_damage)


func get_damage(hitbox: HitboxComponent) -> void:
	health_component.health -= hitbox.damage
