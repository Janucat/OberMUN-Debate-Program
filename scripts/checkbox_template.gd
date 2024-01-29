extends CheckBox

var id = ""
signal pressed_id
# Called when the node enters the scene tree for the first time.
func _ready():
	self.toggled.connect(signal_pressed_id)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func signal_pressed_id(toggled):
	pressed_id.emit(toggled, id)
