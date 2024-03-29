extends Node

onready var scoreText = $score

var score = 0

func _ready():
	scoreText.text = str(score)
	_showViewport()

func _on_hammer_nail_hit():
	score += 1
	scoreText.text = str(score)

func _on_hammer_gameEnd():
	levelManager.load_end_game(score)

func _showViewport():
	# Get the viewport and clear it
	var viewport = get_node("Viewport")
	viewport.set_clear_mode(Viewport.CLEAR_MODE_ONLY_NEXT_FRAME)
#
#	# Let two frames pass to make sure the vieport's is captured
	yield(get_tree(), "idle_frame")
	yield(get_tree(), "idle_frame")

	# Retrieve the texture and set it to the viewport quad
	get_node("viewportQuad").material_override.albedo_texture = viewport.get_texture()
	print(get_node("viewportQuad").material_override.albedo_texture)
#	print(get_node("viewport_quad").material_override)