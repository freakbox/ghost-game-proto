extends Node2D

@onready var transition: Transition = $Transition
@onready var enemymap: EnemyMap = $Enemymap
@onready var whoosh_player: AudioStreamPlayer = $WhooshPlayer

func _ready() -> void:
	enemymap.player_reached.connect(call_battle_scene)


func call_battle_scene() -> void:
	transition.circle_out(Callable(self, "_go_battle_scene"))
	whoosh_player.play()


func _go_battle_scene():
	#get_tree().change_scene_to_file("res://scenes/next_scene.tscn")
	get_tree().call_deferred("change_scene_to_file", "res://scenes/battle/battle.tscn")
	#transition.fade_in()
