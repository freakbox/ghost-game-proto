class_name PlayerShotComponent
extends Node

@export var player: Player
@export var spawner_component: SpawnerComponent
@export var shot_interval: float
var _current_shot_interval: float = 0

var enabled: bool = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not enabled:
		return
	
	if _current_shot_interval > 0:
		_current_shot_interval -= delta
	else:
		if Input.is_action_just_pressed("shot"):
			fire_shots()
			_current_shot_interval = shot_interval



func fire_shots() -> void:
	var shot: CharacterBody2D = spawner_component.spawn(player.global_position, get_parent().get_parent().get_parent())
	shot.velocity = player.face_direction * 200
	shot.rotation = player.face_direction.angle()
	shot.rotation_degrees += 270
