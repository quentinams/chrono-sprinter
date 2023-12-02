extends Node2D

var screensize
# Called when the node enters the scene tree for the first time.
func _ready():
	screensize = get_parent().get_node("Camera/Camera2D").get_viewport_rect()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("player_up"):
		self.position.y -= 10
	if Input.is_action_pressed("player_down"):
		self.position.y += 10
	if Input.is_action_pressed("player_left"):
		self.position.x -= 10
	if Input.is_action_pressed("player_right"):
		self.position.x += 10
	position.x = clamp(position.x, screensize.position.x, screensize.end.x)
	position.y = clamp(position.y, screensize.position.y, screensize.end.y)
	pass
