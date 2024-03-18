extends Node


var storage = 0
var maxStorage = 2

# Called when the node enters the scene tree for the first time.
func _ready():
	storage = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func storageIncrease():
	storage += 1
	
	
func restartGame():
	storage = 0
	
