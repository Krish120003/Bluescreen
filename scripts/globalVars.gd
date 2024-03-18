extends Node


var storage = 0
var handicap = 1
var maxStorage = 4

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
	handicap = 2
	
