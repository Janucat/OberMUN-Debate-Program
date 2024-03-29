extends LinkButton

func _ready():
	var dir = DirAccess.open("user://")
	if !dir.dir_exists("user://records"):
		var error = dir.make_dir("user://records")
	uri = "/".join([OS.get_user_data_dir(), "records"])

func _process(delta):
	pass
