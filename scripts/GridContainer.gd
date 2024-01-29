extends GridContainer

@onready var data = get_node("../..")
var state_check_box = preload("res://state_check_box.tscn")

var nations_selected = []

var file_path = "res://art/Flags/%s"

# Called when the node enters the scene tree for the first time.
func _ready(): 
	data.data_created.connect(list_checkboxes)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func list_checkboxes():
	for i in data.nations_id.size():
		var checkbox = state_check_box.instantiate()
		var icon = load(file_path % data.nations_image.get(data.nations_id[i]))
		checkbox.icon = icon
		checkbox.text = data.nations_name.get(data.nations_id[i])
		checkbox.id = data.nations_id[i]
		checkbox.pressed_id.connect(checkbox_toggled)
		add_child(checkbox)

func checkbox_toggled(toggled, id):
	if toggled:
		nations_selected.append(id)
	if !toggled:
		nations_selected.remove(id)
