extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func leftMouseClick():
	get_tree().get_root().selectedElement=self
	print("CLICKED!!")
	
func _on_BoxObject_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseMotion:
		get_tree().get_root().setHoveredNode(self)
		
func _on_BoxObject_mouse_exited():
	get_tree().get_root().unsetHoveredNode(self)

