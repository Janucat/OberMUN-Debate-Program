extends Button

signal select_all_partecipants
# Called when the node enters the scene tree for the first time.
func _ready():
	self.pressed.connect(select_all)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func select_all():
	select_all_partecipants.emit()
