extends Button

@onready var container = $"../UNEP Container/GridContainer"

# Called when the node enters the scene tree for the first time.
func _ready():
	self.pressed.connect(start_session)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func start_session():
	print(container.nations_selected)
	
