extends Label
@onready var texture_rect = $TextureRect
@onready var check_button = $CheckButton
@onready var favor = $Favor
@onready var against = $Against
@onready var abstain = $Abstain

signal checked(object, value: int)

var icon = ""
var id = ""


func _on_check_button_toggled(_button_pressed):
	checked.emit(self, check_button.get_draw_mode())

func _on_favor_pressed():
	checked.emit(self, 1)

func _on_against_pressed():
	checked.emit(self, 2)

func _on_abstain_pressed():
	checked.emit(self, 3)
