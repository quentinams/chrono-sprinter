extends Node2D

var enemy = preload("res://scene/enemy.tscn")
var bullet = preload("res://scene/bullet.tscn")
@onready var screensize = get_node("Camera/Camera2D").get_viewport_rect()


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("spawn_enemy").start()
	pass # Replace with function body.


func spawn_bullet():
	var new_bullet = bullet.instantiate()
	var new_bullet_pos = $Player.position + (($Player.player_size * $Player.player_scale) / 2)
	new_bullet.global_position = new_bullet_pos
	new_bullet.velocity = Vector2 (1000, 0)
	self.add_child(new_bullet)


func spawn_enemy():
	var new_enemy = enemy.instantiate()
	new_enemy.global_position = Vector2(800, randi_range(screensize.position.y, screensize.end.y))
	new_enemy.velocity = Vector2(randi_range(-200, -600), 0)
	self.add_child(new_enemy)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("player_shoot"):
		spawn_bullet()
		$Player.is_moving = true
	pass


func _on_spawn_enemy_timeout():
	spawn_enemy()
	get_node("spawn_enemy").stop()
	get_node("spawn_enemy").start()
	pass # Replace with function body.
