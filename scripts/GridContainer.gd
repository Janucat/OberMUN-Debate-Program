extends GridContainer

@onready var deselect_all_button = $"../../Deselect All"
@onready var select_all_button = $"../../Select All"
@onready var data = get_node("../..")

var state_check_box = preload("res://state_check_box.tscn")

var nations_selected = []

var file_path = "res://art/Flags/%s"

# Called when the node enters the scene tree for the first time.
func _ready(): 
	data.data_created.connect(list_checkboxes)
	select_all_button.select_all_partecipants.connect(select_all)
	deselect_all_button.deselect_all_partecipants.connect(deselect_all)


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

func checkbox_toggled(value, id):
	if value:
		nations_selected.append(id)
	if !value:
		nations_selected.erase(id)

func select_all():
	for i in get_child_count():
		var child = get_child(i)
		child.button_pressed = true

func deselect_all():
	for i in get_child_count():
		var child = get_child(i)
		child.button_pressed = false
