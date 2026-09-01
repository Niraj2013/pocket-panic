extends Node2D
@onready var timer: Node2D = $Timer

var buttons_pressed := 0
var timer_end = false

func _ready() -> void:
		await timer.Timer(7.0)
		timer_end = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
		if buttons_pressed == 4:
				if Global.minigames_done > 3:
					get_tree().change_scene_to_file("res://scenes/done_screen.tscn")
				else:
					get_tree().change_scene_to_file("res://Scenes/Timer.tscn")
					
		if timer_end:
				Global.lives -= 1
				Global.minigames_done -=1
				get_tree().change_scene_to_file("res://Scenes/Timer.tscn")
