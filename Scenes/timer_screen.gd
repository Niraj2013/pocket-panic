extends Node2D
@onready var Heart_container: HBoxContainer = $HeartContainer
@onready var Heart: TextureRect = $HeartContainer/Heart
@onready var Heart_2: TextureRect = $HeartContainer/Heart2
@onready var Heart_3: TextureRect = $HeartContainer/Heart3
@onready var Heart_4: TextureRect = $HeartContainer/Heart4
@onready var Heart_5: TextureRect = $HeartContainer/Heart5
@onready var Level: RichTextLabel = $Level
@onready var Timer: RichTextLabel = $Timer

var time
func _ready() -> void:
	await Timer(5.0)
	if Global.minigames_done < 3:
		Global.minigames_done = Global.minigames_done +1
		get_tree().change_scene_to_file("res://Scenes/minigame_" + str(Global.minigames_done) + ".tscn")
		
		else:
			get_tree().change_scene_to_file("res//Scenes/title_scene.tscn")
			
func _process(delta: float) -> void:
	match Global.lives:
		
		4:
			Heart.hide()
		3:
			Heart.hide()
			Heart_2.hide()
		2:
			Heart.hide()
			Heart_2.hide()
			Heart_3.hide()
		1:
			Heart.hide()
			Heart_2.hide()
			Heart_3.hide()
			Heart_4.hide()
		0:
			Heart_container.hide()
	timer.text = str(time)
	level.text = "Level" + str(Global.minigames_done)
funct Timer(start_time: float):
	time = start_time
	
	while time > 0.0:
		await wait(0.1)
		time-=0.1
		
	return
func wait(second:float) -> void:
	await get_tree().create_timer(seconds).timeout
