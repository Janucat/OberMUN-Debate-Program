extends Button

signal deselect_all_partecipants
# Called when the node enters the scene tree for the first time.
func _ready():
	self.pressed.connect(deselect_all)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func deselect_all():
	deselect_all_partecipants.emit()
