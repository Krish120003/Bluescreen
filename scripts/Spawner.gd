extends Marker2D

var popup = preload("res://scenes/popup.tscn")
@onready var timer = get_node("Timer")

@export var handicap = 3
@export var storage = 0

var differenceInSpawn = 4


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
	#var e = get_parent().texture.get_size()
	var xDif = randi() % 550
	var yDif = randi() % 250
	popupSpawned.position = Vector2(xDif,yDif)
	add_child(popupSpawned)
	resetSpawn()
	
func incrementStorage():
	storage += 1
	print("storage:", storage)
	
	
