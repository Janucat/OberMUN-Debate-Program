extends CanvasLayer

@onready var main = $"../MainMenu"
@onready var start_session = $"../MainMenu/Start Session"

@onready var sel_comm = $"../MainMenu/SelectionButtons/SelectCommittee"
@onready var sel_topic = $"../MainMenu/SelectionButtons/SelectTopic"
@onready var sel_session = $"../MainMenu/SelectionButtons/SelectSession"

@onready var president = $Texts/President
@onready var vice = $Texts/Vice
@onready var moderator = $Texts/Moderator
@onready var committee = $Texts/Committee
@onready var topic = $Texts/Topic
@onready var session = $Texts/Session

@onready var sel_nations = $"../MainMenu/UNEP Container/GridContainer"
@onready var del_list_o = $DelegatesList/GridContainer
@onready var speak_list_o = $SpeakersList/GridContainer

@onready var file_dialog: FileDialog = $FileDialog
@onready var news_image: TextureRect = $NewsImage
@onready var news_image_close_button: Button = $NewsImageCloseButton



var delegate_obj = preload("res://scenes/delegate_list_object.tscn")

var file_path = "res://art/Flags/%s"

var del_list = []
var speak_list = []

func _ready():
	start_session.start_session.connect(start)
	

func _process(delta):
	pass

func start():
	if(main.comm_pres.get(sel_comm.committee) != null):
		president.text = main.comm_pres.get(sel_comm.committee)
		vice.text = main.comm_vice.get(sel_comm.committee)
		moderator.text = main.comm_mod.get(sel_comm.committee)
		committee.text = sel_comm.committee
		topic.text = sel_topic.topic
		session.text = str(sel_session.session)
	
	for i in sel_nations.nations_selected.size():
		create_del(sel_nations.nations_selected[i], del_list_o)
		del_list.append(sel_nations.nations_selected[i])
		
func create_del(id, list_o):
	var del = delegate_obj.instantiate()
	del.id = id
	del.icon = main.nations_image.get(id)
	del.get_child(5).text = main.nations_name.get(id)
	del.get_child(4).text = str(main.nations_warn.get(id))
	del.get_child(2).texture = load(file_path % main.nations_image.get(id))
	del.left.connect(leftf)
	del.right.connect(rightf)
	del.warn.connect(warnf)
	list_o.add_child(del)
	

func warnf(id):
	main.nations_warn[id] += 1
	refresh()
	

func leftf(id):
	if !del_list.has(id):
		speak_list.erase(id)
		del_list.append(id)
		refresh()

func rightf(id):
	if !speak_list.has(id):
		del_list.erase(id)
		speak_list.append(id)
		refresh()

func refresh():
	var imax = del_list_o.get_children().size()
	for i in imax:
		del_list_o.remove_child(del_list_o.get_children()[0])
	imax = speak_list_o.get_children().size()
	for i in imax:
		speak_list_o.remove_child(speak_list_o.get_children()[0])
	
	for i in del_list.size():
		create_del(del_list[i], del_list_o)
	for i in speak_list.size():
		create_del(speak_list[i], speak_list_o)

func _on_news_button_pressed() -> void:
	file_dialog.show()

func _on_file_dialog_file_selected(path: String) -> void:
	var image = Image.load_from_file(path)
	var texture = ImageTexture.create_from_image(image)
	news_image.texture = texture
	file_dialog.hide()
	news_image.show()
	news_image_close_button.show()


func _on_news_image_close_button_pressed() -> void:
	news_image.hide()
	news_image_close_button.hide()
