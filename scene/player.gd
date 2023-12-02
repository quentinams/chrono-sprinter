extends Node2D

var speed = 800
var screen_size
var player_size = Vector2 (128, 128)
var player_scale = Vector2 (0.5, 0.5)
var player_start_pos = Vector2 (50, 500)

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_parent().get_node("Camera/Camera2D").get_viewport_rect()
	position = player_start_pos
	_print_infos()

func _print_infos():
	print("player_size = ", player_size)
	print("player_scale = ", player_scale)
	print("player_start_pos = ", player_start_pos)

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
	position.x = clamp(position.x, screen_size.position.x, screen_size.end.x - (player_size.x * player_scale.x))
	position.y = clamp(position.y, screen_size.position.y, screen_size.end.y - (player_size.y * player_scale.y))
