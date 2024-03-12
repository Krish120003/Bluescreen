extends Area2D

@onready var timer = get_node("Timer")
@onready var background: Sprite2D = get_node("BGSprite")
var warning = false # if window has started flashing
var originalSpawnTime = 3
var warningSpawnTime = 2

# Called when the node enters the scene tree for the first time.
func _ready():
	timer.set_wait_time(originalSpawnTime)
	timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	print("clicked") # Replace with function body.
	queue_free()


func _on_timer_timeout():
	if !warning:
		# make indicator, change timer to decided seconds left
		timer.set_wait_time(warningSpawnTime)
		background.self_modulate = Color("Red")
		warning = true
	else:
		# ADD TO TOTAL
		queue_free()

