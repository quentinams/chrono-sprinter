extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("up"):
		self.position.y -= 10
	if Input.is_action_pressed("down"):
		self.position.y += 10
	if Input.is_action_pressed("left"):
		self.position.x -= 10
	if Input.is_action_pressed("right"):
		self.position.x += 10
	pass
