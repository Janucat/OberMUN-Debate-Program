extends GridContainer
var data: Data

var file_path = "res://art/Flags/%s"

# Called when the node enters the scene tree for the first time.
func _ready(): 
	for i in data.nations_id.size():
		var checkbox = CheckBox.new()
		var icon = load(file_path % data.nations_image.find_key(data.nations_id[i]))
		checkbox.icon = icon
		checkbox.text = data.nations_name.find_key(data.nations_id[i])
		add_child(checkbox)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
