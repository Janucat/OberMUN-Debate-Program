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


var delegate_obj = preload("res://delegate_list_object.tscn")

var del_list = []

func _ready():
	start_session.start_session.connect(start)
	

func _process(delta):
	pass

func start():
	president.text = main.comm_pres.get(sel_comm.committee)
	vice.text = main.comm_vice.get(sel_comm.committee)
	moderator.text = main.comm_mod.get(sel_comm.committee)
	committee.text = sel_comm.committee
	topic.text = sel_topic.topic
	session.text = str(sel_session.session)
	
	for i in sel_nations.nations_selected.size():
		var del = delegate_obj.instantiate()
		del.id = sel_nations.nations_selected[i]
		del.icon = main.nations_image.get(sel_nations.nations_selected[i])
		del.warn.connect(warnf)
		del.left.connect(leftf)
		del.right.connect(rightf)
		
		

func warnf(id):
	pass

func leftf(id):
	pass

func rightf(id):
	pass
