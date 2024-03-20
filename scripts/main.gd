extends Node2D

var CustomPopup = preload("res://scenes/popup.tscn")
var Spawner = preload("res://scenes/spawner.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	$music.play()
	GlobalVars.restartGame()
	var spawner = Spawner.instantiate()
	$CanvasLayer/TextureRect/Center.add_child(spawner)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if GlobalVars.storage >= GlobalVars.maxStorage:
		# end the game
		get_tree().change_scene_to_file("res://scenes/endscreen.tscn")
		#$gameover.play()
		

func _on_timer_timeout():
	#print("HARDER!!!")
	if GlobalVars.handicap > 0:
		GlobalVars.handicap -= 0.4
