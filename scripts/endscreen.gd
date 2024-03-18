extends CanvasLayer



func _on_reboot_pressed():
	get_tree().change_scene_to_file("res://scenes/main.tscn")
