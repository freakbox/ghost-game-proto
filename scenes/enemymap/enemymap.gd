extends CharacterBody2D

@onready var ray_cast_2d: RayCast2D = $RayCast2D
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

@export var speed: float = 80

var _chasing_player: bool = false
var _player: CharacterBody2D

@onready var battle_trigger_area_2d: Area2D = $BattleTriggerArea2D

func _ready() -> void:
	battle_trigger_area_2d.body_entered.connect(call_battle_scene)


func _physics_process(delta: float) -> void:
	if _chasing_player:
		# Direction from this character to the target
		var direction := (_player.global_position - global_position).normalized()
	
		# Move towards the target
		velocity = direction * speed
		move_and_slide()
		
	else:
		if ray_cast_2d.is_colliding():
			print('chase player')
			_chasing_player = true
			_player = ray_cast_2d.get_collider()
			audio_stream_player.play()
	


func call_battle_scene(_body: CharacterBody2D) -> void:
	get_tree().call_deferred("change_scene_to_file", "res://scenes/battle/battle.tscn")
	
