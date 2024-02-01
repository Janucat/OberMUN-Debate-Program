extends OptionButton

@onready var data = $"../.."

var committee = ""

func _ready():
	data.data_created.connect(list_contents)
	self.item_selected.connect(comm_sel)

func _process(delta):
	pass

func list_contents():
	for i in data.comm_id.size():
		add_item(data.comm_id[i], i)

func comm_sel(index):
	committee = get_item_text(index)
