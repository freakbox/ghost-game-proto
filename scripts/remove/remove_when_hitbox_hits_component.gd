class_name RemoveWhenHitboxHitsComponent
extends Node

@export var actor: Node2D
@export var hitbox_component: HitboxComponent

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hitbox_component.hit_hurtbox.connect(actor.queue_free.unbind(1))
