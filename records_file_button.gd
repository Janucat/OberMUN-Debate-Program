extends LinkButton

func _ready():
	uri = "/".join([OS.get_user_data_dir(), "records"])

func _process(delta):
	pass
