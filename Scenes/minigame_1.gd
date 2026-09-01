extends Node2D
@onready var timer: Node2D= $Timer

var heart_collected = 0
var timer_end = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
		await timer.Timer(10.0)
		timer_end = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
		
		if heart_collected == 4:
				if Global.minigames_done > 4:
						get_tree().change_scene_to_file("res://scenes/done_screen.tscn")
				else:
						get_tree().change_scene_to_file("res://scenes/timer_screen.tscn")
						
		if timer_end:
				Global.minigames_done -=1
				Global.lives -= 1
				get_tree().change_scene_to_file("res://scenes/timer_screen.tscn")
				
func Heart_collect() -> void:
		heart_collected = heart_collected+1
		return
