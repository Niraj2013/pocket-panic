extends Node2D

@onready var timer: Node2D = $Timer

var buttons_pressed := 0
var timer_end = false
var game_finished = false  # Lock variable

func _ready() -> void:
	await timer.Timer(7.0)
	if not game_finished:
		timer_end = true

func _process(_delta: float) -> void:
	if game_finished:
		return

	# WIN CONDITION: Player pressed 4 buttons
	if buttons_pressed >= 4:
		game_finished = true
		#Global.lives += 1
		get_tree().change_scene_to_file("res://Scenes/level_scene.tscn")
					
	# LOSS CONDITION: Time expired
	if timer_end:
		game_finished = true
		
		if Global.lives == 0:
			get_tree().change_scene_to_file("res://Scenes/level_scene.tscn")
		else:
			Global.lives -= 1
			Global.minigames_done -= 1  # Adds exactly 1
			get_tree().change_scene_to_file("res://Scenes/level_scene.tscn")
			return
