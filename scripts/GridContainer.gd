extends GridContainer

@onready var data = get_node("../..")

var file_path = "res://art/Flags/%s"

# Called when the node enters the scene tree for the first time.
func _ready(): 
	data.data_created.connect(list_checkboxes)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func list_checkboxes():
	for i in data.nations_id.size():
		var checkbox = CheckBox.new()
		var icon = load(file_path % data.nations_image.get(data.nations_id[i]))
		checkbox.icon = icon
		checkbox.text = data.nations_name.get(data.nations_id[i])
		add_child(checkbox)
