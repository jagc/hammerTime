extends Node

onready var score = $score

var scoreAmount = 0

func _ready():
	score.bbcode_text = "[center]" + str(scoreAmount) + "[/center]"

func _on_Button_pressed():
	levelManager.change_scene("game")

func _on_menu_pressed():
	levelManager.change_scene("menu")
