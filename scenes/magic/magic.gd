extends Node2D

@onready var hitbox_component: HitboxComponent = $HitboxComponent

var speed: float = -100
var velocity: Vector2

func _ready() -> void:
	hitbox_component.hit_hurtbox.connect(destroy_shot)
	velocity.x = 0
	velocity.y = speed


func _physics_process(delta: float) -> void:
	position += velocity * delta


func destroy_shot(hurtbox: HurtboxComponent) -> void:
	queue_free()
