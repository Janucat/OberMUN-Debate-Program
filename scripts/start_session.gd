extends Button

@onready var container = $"../UNEP Container/GridContainer"
@onready var comm_button = $"../SelectionButtons/SelectCommittee"
@onready var topic_button = $"../SelectionButtons/SelectTopic"
@onready var session_button = $"../SelectionButtons/SelectSession"
@onready var main_menu = $".."
@onready var session = $"../../Session"
@onready var records = $"../../Management"
@onready var records_button = $"../RecordsButton"


signal start_session

func _ready():
	self.pressed.connect(start_session_func)
	records_button.pressed.connect(records_window)


func _process(delta):
	pass

func start_session_func():
	main_menu.hide()
	session.show()
	start_session.emit()

func records_window():
	main_menu.hide()
	records.show()
