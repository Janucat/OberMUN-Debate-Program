extends Button

@onready var check_box = $"../UNEP Container/GridContainer/"

var partecipants = []

# Called when the node enters the scene tree for the first time.
func _ready():
	self.pressed.connect(start_session)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func start_session():
	pass
	#!!!!Collegare il button_pressed: bool di tutte le CheckBox figlie di GridContainer!!!!
