class_name Ghost
extends Area2D

@export var player: Player
@export var attack_velocity: float = 300
@export var return_velocity: float = 300

@onready var ray_cast_2d: RayCast2D = $RayCast2D
@onready var hitbox_component: HitboxComponent = $HitboxComponent

var _attacking: bool = false
var _enemy_possessed: EnemyMap
var _enemy_target: EnemyMap


func _ready() -> void:
	body_entered.connect(take_enemy)
	hitbox_component.hit_hurtbox.connect(
		func(hurtbox: HurtboxComponent) -> void:
			_enemy_possessed.health_component.health -= 1
	)


func take_enemy(enemy: EnemyMap) -> void:
	if _attacking:
		print('get enemy')
		enemy.get_ghost(self)
		_enemy_possessed = enemy


func _physics_process(delta: float) -> void:
	if not is_instance_valid(_enemy_target):
		ray_cast_2d.rotate(delta * 10)
		_enemy_target = null
