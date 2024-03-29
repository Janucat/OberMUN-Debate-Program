extends CanvasLayer

@onready var voting = $"../VotingPage"
@onready var sel_comm = $"../MainMenu/SelectionButtons/SelectCommittee"
@onready var sel_topic = $"../MainMenu/SelectionButtons/SelectTopic"
@onready var sel_session = $"../MainMenu/SelectionButtons/SelectSession"
@onready var main = $"../MainMenu"

@onready var refresh_button = $Button
@onready var file_list_button = $FileList

var file_list = []

func _ready():
	voting.makerecord.connect(makerecord)
	refresh_button.pressed.connect(refresh)
	file_list_button.item_selected.connect(read_file)
	refresh()

func _process(delta):
	pass

func refresh():
	var dir = DirAccess.open("user://records")
	file_list = dir.get_files()
	for i in file_list:
		file_list_button.add_item(i)
		
func read_file(id):
	pass #open file in file_list with id, get dict from json, write info in textedit

func makerecord(results):
	var record_data = {
		"filetype": "record",
		"date": " ".join([Time.get_date_string_from_system(), Time.get_time_string_from_system()]),
		
		"committee": sel_comm.committee,
		"topic": sel_topic.topic,
		"session": sel_session.session,
		
		"president": main.comm_pres.get(sel_comm.committee),
		"vice": main.comm_vice.get(sel_comm.committee),
		"mod": main.comm_mod.get(sel_comm.committee),
		
		"results": results
	}
	var record_path = "".join(["user://records/record ", record_data.get("date").replace(":", "-"), ".json"])
	
	var json_results = JSON.stringify(record_data, "\t")
	var file = FileAccess.open(record_path, FileAccess.WRITE_READ)
	file.store_string(json_results)
	
