extends Node2D


func _ready() -> void:
	pass 


func _process(delta: float) -> void:
	pass


func _on_start_pressed() -> void:
	pass 

func _on_button_pressed() -> void:
	Global.lives = 5
	Global.minigames_done = 0
	get_tree().change_scene_to_file("res://Scenes/level_scene.tscn")
