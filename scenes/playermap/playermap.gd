class_name Player
extends CharacterBody2D

@onready var hurtbox_component: HurtboxComponent = $HurtboxComponent

@export var hit_knockback_time: float = 0.3
@export var hit_knockback_impact: float = 100
@export var hit_invincible_time: float = 0.6
var _current_hit_knockback: float

var direction: Vector2
var face_direction: Vector2

func _ready() -> void:
	hurtbox_component.hurt.connect(
		func(hitbox: HitboxComponent) -> void:
			_current_hit_knockback = hit_knockback_time
			velocity = hitbox.global_position.direction_to(hurtbox_component.global_position) * hit_knockback_impact
			hurtbox_component.is_invincible = true
			var invincible_timer: SceneTreeTimer = get_tree().create_timer(hit_invincible_time)
			invincible_timer.timeout.connect(
				func() -> void:
					hurtbox_component.is_invincible = false
			)
	)
	face_direction = Vector2.DOWN

func _physics_process(delta: float) -> void:
	if Input.get_vector("left", "right", "up", "down").length() > 0.1:
		face_direction = Input.get_vector("left", "right", "up", "down")
	
	if _current_hit_knockback >= 0:
		_current_hit_knockback -= delta
	else:
		direction = Input.get_vector("left", "right", "up", "down")
		velocity = direction * 100
	move_and_slide()
