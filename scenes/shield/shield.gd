class_name Shield
extends CharacterBody2D

const SPEED: float = 100
@onready var hurtbox_component: HurtboxComponent = $HurtboxComponent
signal magic_hit
@onready var spawner_component: SpawnerComponent = $SpawnerComponent

func _ready() -> void:
	hurtbox_component.hurt.connect(handle_hurtbox_hit)


func handle_hurtbox_hit(hitbox: HitboxComponent) -> void:
	magic_hit.emit()


func _physics_process(delta: float) -> void:
	velocity.x = Input.get_axis("left", "right") * SPEED
	move_and_slide()


func cast_magic() -> void:
	spawner_component.spawn()
