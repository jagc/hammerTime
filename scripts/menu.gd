extends Node

func _on_Button_pressed():
	levelManager.change_scene("game")

func _on_quit_pressed():
	get_tree().quit()