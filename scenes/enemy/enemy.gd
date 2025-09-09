extends CharacterBody2D

@onready var shot_timer: Timer = $ShotTimer
@onready var spawner_component: SpawnerComponent = $SpawnerComponent

@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var ray_cast_right: RayCast2D = $RayCastRight

var speed: float = 80
var walking_state: int = 0
var current_state_time: float = 0.2
var walking_direction: int = 1


func _ready() -> void:
	velocity.x = speed
	shot_timer.timeout.connect(func() -> void:
		spawner_component.spawn(global_position)
		)


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
		
