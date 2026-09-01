extends TextureButton
@onready var parent = $".."

func _process(_delta: float) -> void:
	hide()
	parent.buttons_pressed += 1
