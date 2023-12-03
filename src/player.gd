extends Area2D

var speed = 600
var player_size = Vector2 (128, 128)
var player_scale = Vector2 (0.5, 0.5)
var player_start_pos = Vector2 (50, 500)
var is_moving = false
var health = 3
@onready var screen_size = get_parent().get_node("Camera/Camera2D").get_viewport_rect()

# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite2D.play("default")
	position = player_start_pos

func _print_infos():
	print("player_size = ", player_size)
	print("player_scale = ", player_scale)
	print("player_start_pos = ", player_start_pos)

func movement(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("player_up"):
		velocity.y -= 1
		is_moving = true
	if Input.is_action_pressed("player_down"):
		velocity.y += 1
		is_moving = true
	if Input.is_action_pressed("player_left"):
		velocity.x -= 1
		is_moving = true
	if Input.is_action_pressed("player_right"):
		velocity.x += 1
		is_moving = true
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	position += velocity * delta
	position.x = clamp(position.x, (screen_size.position.x + (player_size.y * player_scale.y) / 4), screen_size.end.x - ((player_size.x * player_scale.x) / 4))
	position.y = clamp(position.y, (screen_size.position.y + (player_size.y * player_scale.y) / 2), screen_size.end.y - ((player_size.y * player_scale.y) / 2))
	if velocity == Vector2.ZERO:
		is_moving = false
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	movement(delta)
	if health <= 0:
		get_tree().change_scene_to_file("res://scene/menu/ending_screen.tscn")
