extends CanvasLayer

@onready var voting = $"../VotingPage"

func _ready():
	voting.makerecord.connect(makerecord)


func _process(delta):
	pass

func makerecord(results):
	var json_results = JSON.stringify(results, "\t")
	var file = FileAccess.open("user://records/record.json", FileAccess.WRITE)
	file.store_string(json_results)
	#NOMERECORD avrà data e ora per evitare sovrapposizioni
	
#   var path = ""
#	if OS.has_feature("editor"):
#		path = ProjectSettings.globalize_path("res://hello.txt")
#	else:
#		path = OS.get_executable_path().get_base_dir().path_join("hello.txt")
