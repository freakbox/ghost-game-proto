extends Node2D

@onready var shield: Shield = $Shield
@onready var hurtbox_component: HurtboxComponent = $HurtboxComponent
@onready var magic_progress_bar: ProgressBar = $MagicProgressBar

func _ready() -> void:
	hurtbox_component.hurt.connect(shake_camera)
	shield.magic_hit.connect(fill_magic_bar)


func fill_magic_bar() -> void:
	if magic_progress_bar.value < magic_progress_bar.max_value:
		magic_progress_bar.value += 1


func shake_camera(hitbox: HitboxComponent) -> void:
	print('shake')


func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("attack"):
		if magic_progress_bar.value == magic_progress_bar.max_value:
			magic_progress_bar.value = 0
			shield.cast_magic()
			
