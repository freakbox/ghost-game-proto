class_name EnemyMap
extends CharacterBody2D

@onready var ray_cast_2d: RayCast2D = $RayCast2D
@export var speed: float = 40
@onready var state_machine_component: StateMachineComponent = $StateMachineComponent
@onready var possessed: EnemyPossessdState = $StateMachineComponent/possessed

var _ghost: Ghost

var _chasing_player: bool = false
var _player: CharacterBody2D

signal player_reached

func _ready() -> void:
	pass


func _physics_process(delta: float) -> void:
	move_and_slide()


func handle_player_reached(_body: CharacterBody2D) -> void:
	player_reached.emit()
	#get_tree().call_deferred("change_scene_to_file", "res://scenes/battle/battle.tscn")
	

func get_ghost(ghost: Ghost) -> void:
	_ghost = ghost
	state_machine_component.state.finished.emit("possessed")

func release_ghost() -> void:
	_ghost = null
