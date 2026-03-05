class_name TTLComponent
extends Node

@export var actor: Node2D
@export var timer: Timer


func _ready() -> void:
	timer.one_shot = true
	timer.timeout.connect(destroy)
	

func destroy() -> void:
	actor.queue_free()
