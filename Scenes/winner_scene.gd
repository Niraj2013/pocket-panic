extends Node2D

@onready var play_again_button: Button = $PlayAgainButton

func _ready() -> void:
	play_again_button.pressed.connect(_on_play_again_button_pressed)

func _on_play_again_button_pressed() -> void:
	# Reset global state for a fresh run
	Global.lives = 5
	Global.minigames_done = 0
	get_tree().change_scene_to_file("res://Scenes/title_scene.tscn")
