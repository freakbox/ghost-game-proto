class_name RemoveWhenCollidesComponent
extends Node

@export var actor: CharacterBody2D
@export var detect_area: Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	detect_area.body_entered.connect(actor.queue_free.unbind(1))
