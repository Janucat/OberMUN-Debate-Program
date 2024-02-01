extends OptionButton

@onready var data = $"../.."

var session = 0

func _ready():
	data.data_created.connect(list_contents)
	self.item_selected.connect(session_sel)

func _process(delta):
	pass

func list_contents():
	for i in range(data.sessions):
		add_item(str(i), i)

func session_sel(index):
	session = get_item_text(index)
