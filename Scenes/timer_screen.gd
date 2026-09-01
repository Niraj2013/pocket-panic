extends Node2D

@onready var heart_container: HBoxContainer = $HeartContainer
@onready var heart: TextureRect = $HeartContainer/Heart
@onready var heart_2: TextureRect = $HeartContainer/Heart2
@onready var heart_3: TextureRect = $HeartContainer/Heart3
@onready var heart_4: TextureRect = $HeartContainer/Heart4
@onready var heart_5: TextureRect = $HeartContainer/Heart5
@onready var level: RichTextLabel = $Level
@onready var timer_label: RichTextLabel = $Timer

var time: float = 5.0


func _ready() -> void:
	start_timer(5.0)

	if Global.minigames_done < 3:
		Global.minigames_done += 1
		get_tree().change_scene_to_file(
			"res://Scenes/minigame_" + str(Global.minigames_done) + ".tscn"
		)
	else:
		get_tree().change_scene_to_file("res://Scenes/title_scene.tscn")


func _process(_delta: float) -> void:
	match Global.lives:
		5:
			pass
		4:
			heart.hide()
		3:
			heart.hide()
			heart_2.hide()
		2:
			heart.hide()
			heart_2.hide()
			heart_3.hide()
		1:
			heart.hide()
			heart_2.hide()
			heart_3.hide()
			heart_4.hide()
		0:
			heart_container.hide()

	timer_label.text = str(ceil(time))
	level.text = "Level " + str(Global.minigames_done)


func start_timer(start_time: float) -> void:
	time = start_time

	while time > 0.0:
		await get_tree().create_timer(0.1).timeout
		time -= 0.1
