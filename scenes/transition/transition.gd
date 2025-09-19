class_name Transition
extends CanvasLayer

@onready var circle_rect: ColorRect = $CircleRect


func _ready():
	circle_rect.visible = false
	
	


# ========== CIRCLE TRANSITION ==========
func circle_out(callback: Callable = Callable(), duration: float = 0.7):
	circle_rect.visible = true
	circle_rect.material.set("shader_parameter/radius", 1.5)
	var tween: Tween = get_tree().create_tween()
	tween.tween_property(circle_rect.material, "shader_parameter/radius", 0.0, duration).finished.connect(
		func() -> void:
			if callback.is_valid():
				callback.call()
	)


func circle_in(duration: float = 0.7):
	var tween: Tween = get_tree().create_tween()
	tween.tween_property(circle_rect.material, "shader_parameter/radius", 1.5, duration).finished.connect(
		func():
			circle_rect.visible = false
	)
