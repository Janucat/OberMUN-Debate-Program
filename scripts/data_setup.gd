extends CanvasLayer

var json_data = preload("res://json/data.json")
var nations_data = []
var nations_id = []
var nations_name = {}
var nations_image = {}
signal data_created

# Called when the node enters the scene tree for the first time.
func _ready():
	nations_data = json_data.data.get("nations")
	
	# Assigning ids to nations_id
	for i in nations_data.size(): 
		nations_id.append(nations_data[i].get("id"))
		
	
	# Assigning names to nations_name and nations_image
	for i in nations_id.size():
		nations_name.merge({
			nations_id[i]: nations_data[i].get("name")
		})
		nations_image.merge({
			nations_id[i]: nations_data[i].get("image")
		})
	
	data_created.emit()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
