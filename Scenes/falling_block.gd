extends Node2D

@export var fall_speed: float = 380.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y += fall_speed *delta
	
	if position.y>700.0:
		queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		get_parent().player_hit()
		queue_free()
