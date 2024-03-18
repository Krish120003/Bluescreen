extends ProgressBar



# Called when the node enters the scene tree for the first time.
func _ready():
	max_value = GlobalVars.maxStorage
	update()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	update()
	
func update():
	value = GlobalVars.storage
