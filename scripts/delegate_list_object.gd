extends TextEdit

@onready var warn_b = $WarnButton
@onready var nation_button: Button = $NationButton

signal shift
signal warn


var icon = ""
var id = ""
var warns = 0


func _ready():
	warn_b.pressed.connect(warnf)
	nation_button.pressed.connect(shiftf)
	
func _process(delta):
	pass

func warnf():
	warn.emit(id)

func shiftf():
	shift.emit(id)




	

#func _enter_tree():
#	var icon_path = load("res://art/Flags/%s" % icon)
#	image.texture.set_texture(icon_path)
