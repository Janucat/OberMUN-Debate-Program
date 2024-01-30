extends OptionButton

@onready var data = $"../.."
@onready var comm_button = $"../SelectCommittee"

var topic = ""
var committee

func _ready():
	self.item_selected.connect(topic_sel)
	comm_button.item_selected.connect(comm_sel)

func _process(delta):
	pass

func comm_sel(index):
	committee = comm_button.get_item_text(index)
	clear()
	add_item("Select a topic", 0)
	if committee != "Select a committee":
		for i in data.comm_topics.get(committee).size():
			add_item(data.comm_topics.get(committee)[i])
	
func topic_sel(index):
	topic = get_item_text(index)
