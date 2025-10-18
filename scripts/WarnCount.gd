extends Label

@onready var main = $".."

signal test

func _ready():
	main.set_warn_s.connect(set_warn)
	

func _process(delta):
	pass

func set_warn(count):
	warn_count.text = count
