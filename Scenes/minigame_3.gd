extends Node2D

@onready var timer = $Timer

var timer_end = false
var game_finished = false

var spawn_cooldown: float = 0.0

var obstacle_template = preload("res://Scenes/falling_block.tscn")

func _ready() -> void:
	await timer.Timer(5.0)
	if not game_finished:
		timer_end = true

func _process(delta: float) -> void:
	if game_finished:
		return

	# WIN CONDITION:
	if timer_end:
		game_finished = true
		get_tree().change_scene_to_file("res://Scenes/level_scene.tscn")
		return

	spawn_cooldown += delta
	if spawn_cooldown >= 0.45:
		spawn_cooldown = 0.0
		_spawn_one_block()

func _spawn_one_block() -> void:
	var block = obstacle_template.instantiate()
	block.position = Vector2(randf_range(50.0, 1100.0), -40.0)
	add_child(block)

func player_hit() -> void:
	if game_finished:
		return
		
	game_finished = true
	
	if Global.lives == 0:
		get_tree().change_scene_to_file("res://Scenes/level_scene.tscn")
	else:
		Global.lives -= 1
		Global.minigames_done -= 1 
		get_tree().change_scene_to_file("res://Scenes/level_scene.tscn")
		return
