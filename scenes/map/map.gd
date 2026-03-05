extends Node2D

@onready var transition: Transition = $Transition
@onready var enemymap: EnemyMap = $Enemymap
@onready var whoosh_player: AudioStreamPlayer = $WhooshPlayer
@onready var rooms: Node2D = $Rooms

func _ready() -> void:
	for r in rooms.get_children():
		RoomControl.rooms.push_back(r)
