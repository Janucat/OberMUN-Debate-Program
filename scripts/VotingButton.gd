extends Button
@onready var session = $".."
@onready var voting_page = $"../../VotingPage"


func _on_pressed():
	session.hide()
	voting_page.show()
