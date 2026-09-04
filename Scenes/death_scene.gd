extends Node2D

@onready var restart_button: Button = $RestartButton

func _ready() -> void:
	# Connect the restart button signal
	restart_button.pressed.connect(_on_restart_button_pressed)

func _on_restart_button_pressed() -> void:
	# Fully reset global state when restarting
	Global.lives = 5
	Global.minigames_done = 0
	get_tree().change_scene_to_file("res://Scenes/level_scene.tscn")
