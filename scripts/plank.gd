extends Area

const NAIL_PATH = "res://scenes/nail.tscn"
const MIN_SPAWN_INTERVAL = 5
const MAX_SPAWN_INTERVAL = 7.5

export var isFirst = false
export var speed = 5

var lastSpawnPosition
var nailsAndBombs = []

func _ready():
	if !isFirst:
		spawnNailsAndBombs()
	var connect = connect("area_entered", self, "_on_area_entered")
	if connect != OK:
		print("something's wrong")

func _on_area_entered(area):
#	$audio.play()
	return area

func _process(delta):
	translation.x += speed * delta
	if translation.x >= 75:
		translation.x = -25 + speed * delta
		spawnNailsAndBombs()
		
func spawnNailsAndBombs():
	for item in nailsAndBombs:
		item.queue_free()

	nailsAndBombs = []
	
	randomize()
	lastSpawnPosition = 0
	while lastSpawnPosition > -50:
		var newItem
		var newItemTranslation
		var xTranslation = rand_range(MIN_SPAWN_INTERVAL, MAX_SPAWN_INTERVAL)
		lastSpawnPosition -= xTranslation
		if lastSpawnPosition < -50:
			lastSpawnPosition = -50
			
		newItem = load(NAIL_PATH).instance()
		newItemTranslation = Vector3(lastSpawnPosition, 0.5, 1)
		add_child(newItem)
		newItem.translation = newItemTranslation
		nailsAndBombs.append(newItem)