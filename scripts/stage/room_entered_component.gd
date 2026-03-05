class_name RoomEneteredComponent
extends Node

@export var room_area: Area2D
@export var room_index: int

func _ready() -> void:
	room_area.body_entered.connect(
		func(body: Node2D) -> void:
			if body is Player:
				print('player entered room ' + str(room_index))
				RoomControl.player_current_room = room_index
			if body is EnemyMap:
				body.current_room_index = room_index
			
	)
