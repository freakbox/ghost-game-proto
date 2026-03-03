class_name Ghost
extends Area2D

@export var player: Player
@export var attack_velocity: float = 300
@export var return_velocity: float = 300

var _attacking: bool = false
var _enemy_possessed: EnemyMap

func _ready() -> void:
	body_entered.connect(take_enemy)


func take_enemy(enemy: EnemyMap) -> void:
	if _attacking:
		print('get enemy')
		enemy.get_ghost(self)
		_enemy_possessed = enemy
