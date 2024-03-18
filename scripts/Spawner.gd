extends Marker2D

var popup = preload("res://scenes/popup.tscn")
var popupWide = preload("res://scenes/popupWide.tscn")
var popupCaptcha = preload("res://scenes/popupCaptcha.tscn")
@onready var timer = get_node("Timer")

@export var handicap = GlobalVars.handicap

var differenceInSpawn = 1
var borderBuffer = 100
var captchaLikelihood = 5 # lower means more likely


# Called when the node enters the scene tree for the first time.
func _ready():
	timer.start()
	resetSpawn()

func resetSpawn():
	var spawnDif = randi() % differenceInSpawn + 0.5
	timer.set_wait_time(handicap + spawnDif)
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
# func _process(delta):
	
func _on_timer_timeout():
	# chose which popup to generate
	var popupSpawned
	var spawnType = randi() % captchaLikelihood
	if spawnType == 0:
		popupSpawned = popupCaptcha.instantiate()
	elif spawnType < captchaLikelihood/2:
		popupSpawned = popupWide.instantiate()
		
	else:
		popupSpawned = popup.instantiate()
		
	# get_parent
	var windowSize = get_parent().get_parent().get_size() 
	# subtraction of spawn type ensures large windows stay in bounds
	var xDif = randi() % (int(windowSize[0]/2)) - (int(windowSize[0]/(8 - int(spawnType == 1)))) # add buffer limit so not out of bounds
	var yDif = randi() % (int(windowSize[1]/2)) - (int(windowSize[1]/(6 - int(spawnType == 1)))) # add buffer limit so not out of bounds
	# add additional randomness for negative
	if randi() % 2 == 0:
		xDif = -xDif
	if randi() % 2 == 0:
		yDif = -yDif  
	popupSpawned.position = Vector2(xDif,yDif)
	add_child(popupSpawned)
	resetSpawn()
	
func incrementStorage():
	GlobalVars.storageIncrease()
	print("storage:", GlobalVars.storage)
	
	
