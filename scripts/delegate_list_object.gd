extends TextEdit

@onready var warn_b = $WarnButton
@onready var right_b = $RightButton
@onready var left_b = $LeftButton

signal right
signal left
signal warn


var icon = ""
var id = ""
var warns = 0


func _ready():
	warn_b.pressed.connect(warnf)
	right_b.pressed.connect(rightf)
	left_b.pressed.connect(leftf)
	
func _process(delta):
	pass

func warnf():
	warn.emit(id)

func leftf():
	left.emit(id)

func rightf():
	right.emit(id)

	
	

	

#func _enter_tree():
#	var icon_path = load("res://art/Flags/%s" % icon)
#	image.texture.set_texture(icon_path)
