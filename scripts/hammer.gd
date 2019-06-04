extends Area

onready var animation = $animation

signal nail_hit
signal gameEnd

var isNailHit = false

func _ready():
	var connect = connect("area_entered", self, "_on_area_entered")
	if connect != OK:
		print("something's wrong")

func _input(event):
	if (event is InputEventMouseButton or InputEventScreenTouch) and event.is_pressed():
		animation.play("hit")

func _on_area_entered(area):
	if area.is_in_group("nails"):
		if area.alreadyHit:
			emit_signal("gameEnd")
			return
		isNailHit = true
		area.alreadyHit = true
		emit_signal("nail_hit")
		
func checkNailHit():
	if !isNailHit:
		emit_signal("gameEnd")
	isNailHit = false