extends Area

onready var animation = $animation
onready var audio = $audio

var alreadyHit = false

func _ready():
	var connect = connect("area_entered", self, "_on_area_entered")
	if connect != OK:
		print("something's wrong")
	pass
	
func _on_area_entered(area):
	if area.name == "hammer" and !alreadyHit:
		audio.play()
		animation.play("hit")