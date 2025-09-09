extends Node2D

@onready var hitbox_component: HitboxComponent = $HitboxComponent
@onready var reflect_hitbox_component: HitboxComponent = $ReflectHitboxComponent

var speed: float = 50
var velocity: Vector2

func _ready() -> void:
	hitbox_component.hit_hurtbox.connect(destroy_shot)
	reflect_hitbox_component.hit_hurtbox.connect(reflect_shot)
	velocity.x = 0
	velocity.y = speed


func _physics_process(delta: float) -> void:
	position += velocity * delta


func destroy_shot(hurtbox: HurtboxComponent) -> void:
	queue_free()


func reflect_shot(hurtbox: HurtboxComponent) -> void:
	var rotation_amount: float = deg_to_rad(180 + ((randf() * 90) - 45))
	var shield: CharacterBody2D = hurtbox.get_parent()
	rotation_amount = deg_to_rad(180 + (shield.velocity.x / 4))
	
	rotation += rotation_amount
	velocity = velocity.rotated(rotation_amount)
	
