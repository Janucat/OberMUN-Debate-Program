extends CanvasLayer

@onready var voting = $"../VotingPage"

func _ready():
	voting.makerecord.connect(makerecord)


func _process(delta):
	pass

func makerecord(results):
	var json_results = JSON.stringify(results)
	
#   var path = ""
#	if OS.has_feature("editor"):
#		path = ProjectSettings.globalize_path("res://hello.txt")
#	else:
#		path = OS.get_executable_path().get_base_dir().path_join("hello.txt")
