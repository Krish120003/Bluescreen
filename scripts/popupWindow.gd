extends Area2D

@onready var timer = get_node("Timer")
@onready var background: Sprite2D = get_node("BGSprite")
var warning = false # if window has started flashing
var originalSpawnTime = 2
var warningSpawnTime = 2


# Called when the node enters the scene tree for the first time.
func _ready():
	# set custom size
	#var xStretch = randi() % 9
	#$"../RichTextLabel/Label".text = "hi"
	#%RichTextLabel.text = "hello"
	var lab = $RichTextLabel/Label
	
	if (lab != null):
		var txt = ""
		
		for n in range(3 + (randi() % 32)):
			var i = randi() % 40;
			if i > 32:
				txt += "!!! h4cks !!!"
			else:
				var c = "abcdefghijklmnopqrstuvwyz1234567890"[i];
				txt += c
		
		lab.text = txt
	
	timer.set_wait_time(originalSpawnTime)
	timer.start()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	queue_free()


func _on_timer_timeout():
	if !warning:
		# make indicator, change timer to decided seconds left
		timer.set_wait_time(warningSpawnTime)
		background.self_modulate = Color("Red")
		warning = true
		
	else:
		# ADD TO TOTAL
		GlobalVars.storageIncrease()
		queue_free()

