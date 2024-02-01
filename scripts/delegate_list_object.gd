extends TextEdit

@onready var warn_b = $WarnButton
@onready var right_b = $RightButton
@onready var left_b = $LeftButton

@onready var texture_rect = $TextureRect

signal warn
signal right
signal left

var icon = ""
var id = ""

func _ready():
	warn_b.pressed.connect(warnf)
	right_b.pressed.connect(rightf)
	left_b.pressed.connect(leftf)
	pass

func _process(delta):
	pass

func warnf():
	warn.emit(id)

func leftf():
	left.emit(id)

func rightf():
	right.emit(id)
