extends CheckBox

var id = ""

signal pressed_id

# Called when the node enters the scene tree for the first time.
func _ready():
	self.toggled.connect(send_pressed_id)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func send_pressed_id(value):
	pressed_id.emit(value, id)
