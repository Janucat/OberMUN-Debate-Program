extends CanvasLayer

@onready var session = $"../Session"
@onready var voting_page = $"../VotingPage"

var json_data = preload("res://json/data.json")

var nations_data = []
var nations_id = []
var nations_name = {}
var nations_image = {}
var nations_warn = {}

var comm_data = []
var comm_id = []
var comm_topics = {}
var comm_pres = {}
var comm_vice = {}
var comm_mod = {}

var sessions = 0

signal data_created

# Called when the node enters the scene tree for the first time.
func _ready():
	show()
	session.hide()
	voting_page.hide()
	
	nations_data = json_data.data.get("nations")
	
	# Assigning ids to nations_id
	for i in nations_data.size(): 
		nations_id.append(nations_data[i].get("id"))
	
	# Assigning names to nations_name and nations_image
	for i in nations_id.size():
		nations_name.merge({
			nations_id[i]: nations_data[i].get("name")
		})
		nations_image.merge({
			nations_id[i]: nations_data[i].get("image")
		})
		nations_warn.merge({
			nations_id[i]: 0
		})
	
	comm_data = json_data.data.get("committees")
	
	for i in comm_data.size(): 
		comm_id.append(comm_data[i].get("committee"))
	
	for i in comm_id.size():
		comm_topics.merge({
			comm_id[i]: comm_data[i].get("topics")
		})
		comm_pres.merge({
			comm_id[i]: comm_data[i].get("president")
		})
		comm_vice.merge({
			comm_id[i]: comm_data[i].get("vice")
		})
		comm_mod.merge({
			comm_id[i]: comm_data[i].get("mod")
		})
	
	sessions = json_data.data.get("sessions")
		
	data_created.emit()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
