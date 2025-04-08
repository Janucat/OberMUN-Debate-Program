extends Label
@onready var texture_rect = $TextureRect
@onready var check_button = $CheckButton

signal checked(object, value: bool)

var icon = ""
var id = ""


func _on_check_button_toggled(button_pressed):
	checked.emit(self, check_button.get_draw_mode())
