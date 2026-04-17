extends Control

@onready var id: TextEdit = $Id

signal delete

func _on_delete_pressed() -> void:
	delete.emit(id.text) 
