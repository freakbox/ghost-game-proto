class_name Enemy
extends CharacterBody2D

@onready var shot_timer: Timer = $ShotTimer
@onready var spawner_component: SpawnerComponent = $SpawnerComponent

@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var ray_cast_right: RayCast2D = $RayCastRight

@onready var hurtbox_component: HurtboxComponent = $HurtboxComponent

var shot_times := [5.0, 1.0, 5.0, 1.0, 4.0, 1.0, 3.0, 0.5, 2.0, 0.5]
var current_time_index: int = 0

var speed: float = 80 * BattleLoader.enemy_speed_relative
var walking_state: int = 0
var current_state_time: float = 0.2
var walking_direction: int = 1

signal enemy_defeated


func _ready() -> void:
	velocity.x = speed
	shot_timer.timeout.connect(func() -> void:
		spawner_component.spawn(global_position)
		current_time_index = (current_time_index + 1) % shot_times.size()
		shot_timer.wait_time = shot_times[current_time_index]
		shot_timer.start()
		)
	hurtbox_component.hurt.connect(get_damage)


func get_damage(hitbox: HitboxComponent) -> void:
	enemy_defeated.emit()
	queue_free()


func _physics_process(delta: float) -> void:
	update_walking(delta)
	move_and_slide()



func update_walking(delta: float) -> void:
	current_state_time -= delta
	
	if walking_state == 0:
		if velocity.x > 0 and ray_cast_right.is_colliding():
			walking_direction = -1
		if velocity.x < 0 and ray_cast_left.is_colliding():
			walking_direction = 1
		
		velocity.x = speed * walking_direction
		
		if current_state_time <= 0:
			walking_state = 1
			current_state_time = 0.1
	else:
		velocity.x = 0
		if current_state_time <= 0:
			walking_state = 0
			current_state_time = 0.2
		
