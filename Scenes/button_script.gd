extends TextureButton
@onready var parent = $".."

func _pressed() -> void:
	hide()
	parent.buttons_pressed += 1
