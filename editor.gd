extends CanvasLayer

var display_list_nation_object = preload("res://editor_nation_list_object.tscn")
#var display_list_committee_object = preload("")

@onready var display_container: GridContainer = $Display/GridContainer

#class Nation:
	#var id = ""
	#var name = ""
	#var icon = ""
	#func _init(_id, _name, _icon):
		#id = _id
		#name = _name
		#icon = _icon
#
#class Committee:
	#var name = ""
	#var topics = ["", ""]
	#func _init(_name, _topic_a, _topic_b):
		#name = _name
		#topics[0] = _topic_a
		#topics[1] = _topic_b

var json_raw = preload("res://json/data.json") # converte in un dizionario il file json
var nations_array = json_raw.data.get("nations") # dividiamo nazioni e committees in due array di dizionari separati
var committee_array = json_raw.data.get("committees")

func load_data(): #chiamato all'apertura dell'editor o quando si modifica qualcosa
	for nation in nations_array:
		var nation_obj = display_list_nation_object.instantiate()
		nation_obj.find_child("Id").text = nation.id
		nation_obj.find_child("Name").text = nation.name
		nation_obj.find_child("Icon").texture = load("res://art/Flags/%s" % nation.image)
		nation_obj.delete.connect(delete_nation) # pulsante delete, passa l'id della nazione
		display_container.add_child(nation_obj) 

func delete_nation(id):
	pass
