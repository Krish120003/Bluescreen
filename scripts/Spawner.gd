extends Marker2D

var popup = preload("res://scenes/popup.tscn")
@onready var timer = get_node("Timer")
@export var handicap = 4

# Called when the node enters the scene tree for the first time.
func _ready():
	timer.start()
	resetSpawn()

func resetSpawn():
	var spawnDif = randi() % 5
	timer.set_wait_time(handicap + spawnDif)
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
# func _process(delta):
	
func _on_timer_timeout():
	var popupSpawned = popup.instantiate()
	add_child(popupSpawned)
	resetSpawn()
	
	
