extends Node2D

var CustomPopup = preload("res://scenes/popup.tscn")
var Spawner = preload("res://scenes/spawner.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	var spawner = Spawner.instantiate()
	$CanvasLayer/Center.add_child(spawner)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

		

	
