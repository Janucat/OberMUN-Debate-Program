extends Button

@onready var container = $"../UNEP Container/GridContainer"
@onready var comm_button = $"../SelectionButtons/SelectCommittee"
@onready var topic_button = $"../SelectionButtons/SelectTopic"
@onready var session_button = $"../SelectionButtons/SelectSession"



func _ready():
	self.pressed.connect(start_session)


func _process(delta):
	pass

func start_session():
	print(comm_button.committee)
	print(topic_button.topic)
	print("Session: %s" % session_button.session)
	print(container.nations_selected)
	
