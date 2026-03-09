class_name DoorSwitch
extends Area2D

@export var door: Node2D
@export var activation_time: float = 10

var switch_opened: bool = false

func _ready() -> void:
	pass


func _physics_process(delta: float) -> void:
	if activation_time > 0:
		if get_overlapping_bodies().size() > 0:
			for b: Node2D in get_overlapping_bodies():
				if b is EnemyMap:
					if not b.possessed:
						activation_time -= delta
	else:
		if not switch_opened:
			switch_opened = true
			door.call_deferred("queue_free")
