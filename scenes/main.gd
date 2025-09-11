extends Node2D

const BATTLE = preload("res://scenes/battle/battle.tscn")

func _on_button_pressed() -> void:
	get_tree().change_scene_to_packed(BATTLE)


func _on_button_2_pressed() -> void:
	BattleLoader.enemy_speed_relative = 1.6
	get_tree().change_scene_to_packed(BATTLE)
