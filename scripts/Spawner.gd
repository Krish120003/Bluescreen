extends Marker2D

var popup = preload("res://scenes/popup.tscn")
@onready var timer = get_node("Timer")

@export var handicap = 0
@export var storage = 0

var differenceInSpawn = 5
var borderBuffer = 100


# Called when the node enters the scene tree for the first time.
func _ready():
	timer.start()
	resetSpawn()

func resetSpawn():
	var spawnDif = randi() % differenceInSpawn
	timer.set_wait_time(handicap + spawnDif)
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
# func _process(delta):
	
func _on_timer_timeout():
	var popupSpawned = popup.instantiate()
	# get_parent
	var windowSize = get_parent().get_parent().get_size() 
	var xDif = randi() % (int(windowSize[0]/2)) - (int(windowSize[0]/8)) # add buffer limit so not out of bounds
	var yDif = randi() % (int(windowSize[1]/2)) - (int(windowSize[1]/8)) # add buffer limit so not out of bounds
	# add additional randomness for negative
	if randi() % 2 == 0:
		xDif = -xDif
	if randi() % 2 == 0:
		yDif = -yDif
	popupSpawned.position = Vector2(xDif,yDif)
	add_child(popupSpawned)
	resetSpawn()
	
func incrementStorage():
	storage += 1
	print("storage:", storage)
	
	
