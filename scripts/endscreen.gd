extends CanvasLayer

var gameover_sound: AudioStreamPlayer2D # Make sure to assign this in the editor

func _ready():
	$gameover.play()

func _on_reboot_pressed():
	get_tree().change_scene_to_file("res://scenes/main.tscn")
# hi
