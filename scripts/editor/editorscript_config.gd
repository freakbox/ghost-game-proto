@tool extends EditorScript

func _run() -> void:
	ProjectSettings.set("display/window/size/viewport_width", 320)
	ProjectSettings.set("display/window/size/viewport_height", 180)
	ProjectSettings.set("display/window/size/window_width_override", 320)
	ProjectSettings.set("display/window/size/window_height_override", 180)
	ProjectSettings.set("display/window/stretch/mode", "viewport")
	ProjectSettings.set("rendering/textures/canvas_textures/default_texture_filter", "Nearest")
	ProjectSettings.set("rendering/2d/snap/snap_2d_transforms_to_pixel", true)
	print('Script run ok!')
	
