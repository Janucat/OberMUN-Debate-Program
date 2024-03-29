extends CanvasLayer

@onready var voting = $"../VotingPage"
@onready var sel_comm = $"../MainMenu/SelectionButtons/SelectCommittee"
@onready var sel_topic = $"../MainMenu/SelectionButtons/SelectTopic"
@onready var sel_session = $"../MainMenu/SelectionButtons/SelectSession"
@onready var main = $"../MainMenu"

@onready var refresh_button = $Button
@onready var file_list_button = $FileList
@onready var box = $TextEdit
@onready var main_menu_button = $MainMenuButton



var file_list = []

func _ready():
	voting.makerecord.connect(makerecord)
	refresh_button.pressed.connect(refresh)
	file_list_button.item_selected.connect(read_file)
	main_menu_button.pressed.connect(main_menu_window)
	refresh()

func _process(delta):
	pass

func refresh():
	file_list_button.clear()
	var dir = DirAccess.open("user://records")
	file_list = dir.get_files()
	for i in file_list:
		file_list_button.add_item(i)
	read_file(0)
		
func read_file(id):
	var file = FileAccess.open("".join(["user://records/", file_list_button.get_item_text(file_list_button.get_item_index(id))]), FileAccess.READ) 
	if FileAccess.get_open_error() == OK:
		
		var json = JSON.new()
		var error = json.parse(file.get_as_text())
		
		if error == OK:
			
			var data = json.data
			
			if data.get("filetype") == "record":
				box.text = "".join([
					data.get("date"), "\n\n",
					"Committee:    ", data.get("committee"), "\n",
					"Topic:    ", data.get("topic"), "\n",
					"Session:    ", str(data.get("session")), "\n\n",
					"President:    ", data.get("president"), "\n",
					"Vicepresident:    ", data.get("vice"), "\n",
					"Moderator:    ", data.get("mod"), "\n\n",
					"Results: ", "\n",
					"\t\tFirst Round:    ", ",  ".join([data.get("results")[0][0], data.get("results")[0][1], data.get("results")[0][2]]), "\n",
					"\t\tSecond Round:    ", ",  ".join([data.get("results")[1][0], data.get("results")[1][1], data.get("results")[1][2]]), "\n",
					"\t\tThird Round:    ", ",  ".join([data.get("results")[2][0], data.get("results")[2][1], data.get("results")[2][2]]), "\n",
				])
				
			else:
				box.text = "File is not a record!"
		else:
			box.text = "Wrong file format!"
	else:
		box.text = "File error: %s" % FileAccess.get_open_error()

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
	
func main_menu_window():
	main.show()
	hide()
