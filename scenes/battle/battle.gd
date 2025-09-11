class_name Battle
extends Node2D

@onready var shield: Shield = $Shield
@onready var hurtbox_component: HurtboxComponent = $HurtboxComponent
@onready var magic_progress_bar: ProgressBar = $MagicProgressBar
@onready var camera_shake_component: CameraShakeComponent = $CameraShakeComponent
@onready var enemy: Enemy = $Enemy

func _ready() -> void:
	hurtbox_component.hurt.connect(shake_camera)
	shield.magic_hit.connect(fill_magic_bar)
	enemy.enemy_defeated.connect(reset_game)


func reset_game() -> void:
	var reset_timer: SceneTreeTimer = get_tree().create_timer(2, true)
	reset_timer.timeout.connect(func() -> void:
		get_tree().change_scene_to_file("res://scenes/main.tscn")
		)


func fill_magic_bar() -> void:
	if magic_progress_bar.value < magic_progress_bar.max_value:
		magic_progress_bar.value += 1


func shake_camera(hitbox: HitboxComponent) -> void:
	camera_shake_component.apply_shake()


func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("attack"):
		if magic_progress_bar.value == magic_progress_bar.max_value:
			magic_progress_bar.value = 0
			shield.cast_magic()
			
