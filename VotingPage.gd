extends CanvasLayer

@onready var main = $"../MainMenu"

@onready var session = $"../Session"

@onready var sel_nations = $"../MainMenu/UNEP Container/GridContainer"

@onready var del_list_o = $DelegatesList/GridContainer

var delegate_obj = preload("res://delegate_vote_simple_object.tscn")

#var del_list = session.del_list

func _ready():
	pass

func create_del(id, list_o):
	var del = delegate_obj.instantiate()
	del.id = id
	del.icon = main.nations_image.get(id)
	del.text = main.nations_name.get(id)
	var icon_path = load("res://art/Flags/%s" % main.nations_image.get(id))
	del.get_child(0).texture = icon_path
	list_o.add_child(del)

func _on_voting_button_pressed():
	print(session.del_list)
	for i in sel_nations.nations_selected.size():
		create_del(sel_nations.nations_selected[i], del_list_o)
		
