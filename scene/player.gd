extends Node2D

var speed = 400
var screensize
# Called when the node enters the scene tree for the first time.
func _ready():
	screensize = get_parent().get_node("Camera/Camera2D").get_viewport_rect()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("player_up"):
		velocity.y -= 1
	if Input.is_action_pressed("player_down"):
		velocity.y += 1
	if Input.is_action_pressed("player_left"):
		velocity.x -= 1
	if Input.is_action_pressed("player_right"):
		velocity.x += 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	position += velocity * delta
	# position.x = clamp(position.x, screensize.position.x, screensize.end.x)
	# position.y = clamp(position.y, screensize.position.y, screensize.end.y)
	pass
