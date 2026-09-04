extends Node2D

@onready var timer: Node2D = $Timer

var heart_collected = 0
var timer_end = false
var game_finished = false

func _ready() -> void:
	for child in get_children():
		if child.has_signal("Heart_collected"):
			child.connect("Heart_collected", Callable(self, "Heart_collect"))

	await timer.Timer(10.0)
	if not game_finished:
		timer_end = true

func _process(_delta: float) -> void:
	if game_finished:
		return

	# WIN CONDITION
	if heart_collected >= 4:
		game_finished = true
		Global.lives += 1  # Retain minigames_done as 0 to retry Level 1
		get_tree().change_scene_to_file("res://Scenes/level_scene.tscn")

	# LOSS CONDITION
	if timer_end:
		game_finished = true
		Global.minigames_done -= 1  # 0 becomes 1
		get_tree().change_scene_to_file("res://Scenes/level_scene.tscn")
		return
func Heart_collect() -> void:
	heart_collected += 1
