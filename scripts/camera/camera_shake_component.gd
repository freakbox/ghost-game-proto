class_name CameraShakeComponent
extends Node

@export var camera: Camera2D
@export var random_strength: float = 5.0
@export var shake_fade: float = 20.0

var rng: RandomNumberGenerator = RandomNumberGenerator.new()
var shake_strength: float = 0.0


func apply_shake(strength_relative: float = 1) -> void:
	shake_strength = random_strength * strength_relative


func _process(delta: float) -> void:
	if shake_strength > 0:
		shake_strength = lerp(shake_strength, 0.0, shake_fade * delta)
		camera.offset = randomOffset()


func randomOffset() -> Vector2:
	return Vector2(rng.randf_range(-shake_strength, shake_strength), rng.randf_range(-shake_strength, shake_strength))
