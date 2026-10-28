extends Control





func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://Scense/main_game.tscn")


func _on_how_to_play_pressed() -> void:
	get_tree().change_scene_to_file("res://Scense/how_to.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit(0)
