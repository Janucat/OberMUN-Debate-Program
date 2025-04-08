extends CanvasLayer

@onready var favor_title = $"Result stuff/Favor_title"
@onready var against_title = $"Result stuff/Against_title"
@onready var abstain_title = $"Result stuff/Abstain_title"

@onready var main = $"../MainMenu"

@onready var session = $"../Session"

@onready var sel_nations = $"../MainMenu/UNEP Container/GridContainer"

@onready var del_list_o = $DelegatesList/GridContainer

@onready var voting_stuff = $"Voting stuff"
@onready var result_stuff = $"Result stuff"

@onready var delegates_list = $DelegatesList

@onready var favor_list = $"Result stuff/FavorList/GridContainer"
@onready var against_list = $"Result stuff/AgainstList/GridContainer"
@onready var abstain_list = $"Result stuff/AbstainList/GridContainer"

@onready var final_results = $"Final Results"

@onready var favor_title1 = $"Final Results/First votation/Favor_title"
@onready var against_title1 = $"Final Results/First votation/Against_title"
@onready var abstain_title1 = $"Final Results/First votation/Abstain_title"

@onready var favor_title2 = $"Final Results/Second votation/Favor_title"
@onready var against_title2 = $"Final Results/Second votation/Against_title"
@onready var abstain_title2 = $"Final Results/Second votation/Abstain_title"

@onready var favor_title3 = $"Final Results/Third votation/Favor_title"
@onready var against_title3 = $"Final Results/Third votation/Against_title"
@onready var abstain_title3 = $"Final Results/Third votation/Abstain_title"

@onready var voting_button = $"../Session/VotingButton"

var delegate_obj = preload("res://scenes/delegate_vote_simple_object.tscn")

var selected_del = []
var favor_del = []
var against_del = []
var abstain_del = []

var results = [[], [], []]

var total_del

var numberOfVotation

var makerecord_state = false

signal makerecord

func _ready():
	numberOfVotation = 0
	delegates_list.show()
	voting_stuff.show()
	result_stuff.hide()
	final_results.hide()

func create_del(id, list_o, isCheck):
	var del = delegate_obj.instantiate()
	del.checked.connect(del_checked)
	del.id = id
	del.icon = main.nations_image.get(id)
	del.text = main.nations_name.get(id)
	var icon_path = load("res://art/Flags/%s" % main.nations_image.get(id))
	del.get_child(0).texture = icon_path
	list_o.add_child(del)
	if !isCheck:
		del.check_button.hide()

func del_checked(del, value):
	if(value) == 0:
		selected_del.append(del)
	else:
		selected_del.erase(del)


func _on_voting_button_pressed():
	if numberOfVotation == 3:
		voting_stuff.hide()
		final_results.show()
		sendresults()
	else:
		for i in sel_nations.nations_selected.size():
			create_del(sel_nations.nations_selected[i], del_list_o, true)
		total_del = del_list_o.get_child_count()
	

func _on_favor_pressed():
	favor_del.append_array(selected_del)
#	print(favor_del)
	clean_children_and_lists()

func _on_against_pressed():
	against_del.append_array(selected_del)
#	print(against_del)
	clean_children_and_lists()
	
func _on_abstain_pressed():
	abstain_del.append_array(selected_del)
#	print(abstain_del)
	clean_children_and_lists()

func clean_children_and_lists():
	var current_object
	for i in selected_del.size():
#		print(i)
		current_object = selected_del[i]
#		print(current_object)
#		print(del_list_o.get_children().find(current_object) != -1)
		if del_list_o.get_children().find(current_object) != -1:
			del_list_o.remove_child(current_object)
	selected_del.clear()
	if del_list_o.get_children().is_empty():
		if numberOfVotation != 3:
			numberOfVotation += 1
		print(numberOfVotation)
#		delegates_list.hide()
		voting_stuff.hide()
		result_stuff.show()
		
		
		for i in favor_del.size():
			create_del(favor_del[i].id, favor_list, false)
		for i in against_del.size():
			create_del(against_del[i].id, against_list, false)
		for i in abstain_del.size():
			create_del(abstain_del[i].id, abstain_list, false)

		against_title.text = "Against: " + str((against_del.size()*100) / total_del) + " % (" + str(against_del.size()) + ")"
		abstain_title.text = "Abstain: " + str((abstain_del.size()*100) / total_del) + " % (" + str(abstain_del.size()) + ")"
		favor_title.text = "Favor: " + str((favor_del.size()*100) / total_del) + " % (" + str(favor_del.size()) + ")"
		
		addtoresults()
		
		if numberOfVotation == 1:
			against_title1.text = against_title.text
			abstain_title1.text = abstain_title.text
			favor_title1.text = favor_title.text
			voting_button.text = "Voting 2/3"
		if numberOfVotation == 2:
			against_title2.text = against_title.text
			abstain_title2.text = abstain_title.text
			favor_title2.text = favor_title.text
			voting_button.text = "Voting 3/3"
		if numberOfVotation == 3:
			against_title3.text = against_title.text
			abstain_title3.text = abstain_title.text
			favor_title3.text = favor_title.text
			voting_button.text = "Results"

func _on_back_to_session_pressed():
	selected_del.clear()
	favor_del.clear()
	against_del.clear()
	abstain_del.clear()
	remove_children(del_list_o)
	remove_children(favor_list)
	remove_children(against_list)
	remove_children(abstain_list)
	result_stuff.hide()
	voting_stuff.show()
	self.hide()
	session.show()
	
func remove_children(object):
	for i in object.get_child_count():
		object.remove_child(object.get_children()[0])

func addtoresults():
	results[numberOfVotation - 1].append(against_title.text)
	results[numberOfVotation - 1].append(abstain_title.text)
	results[numberOfVotation - 1].append(favor_title.text)

func sendresults():
	if !makerecord_state:
		makerecord_state = !makerecord_state
		makerecord.emit(results)
