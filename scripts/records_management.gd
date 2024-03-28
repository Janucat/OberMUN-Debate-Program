extends CanvasLayer

@onready var voting = $"../VotingPage"
@onready var sel_comm = $"../MainMenu/SelectionButtons/SelectCommittee"
@onready var sel_topic = $"../MainMenu/SelectionButtons/SelectTopic"
@onready var sel_session = $"../MainMenu/SelectionButtons/SelectSession"
@onready var main = $"../MainMenu"

func _ready():
	voting.makerecord.connect(makerecord)


func _process(delta):
	pass

func makerecord(results):
	var record_data = {
		"filetype": "record",
		"date": "", #data
		
		"committee": sel_comm.committee,
		"topic": sel_topic.topic,
		"session": sel_session.session,
		
		"president": main.comm_pres.get(sel_comm.committee),
		"vice": main.comm_vice.get(sel_comm.committee),
		"mod": main.comm_mod.get(sel_comm.committee),
		
		"results": []
	}
	var json_results = JSON.stringify(results, "\t")
	var file = FileAccess.open("user://records/record.json", FileAccess.WRITE_READ)
	file.store_string(json_results)
	#NOMERECORD avrà data e ora per evitare sovrapposizioni
	#results in record_data
	
