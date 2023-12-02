extends Node2D

var enemy = preload("res://scene/enemy.tscn")
var screensize
# Called when the node enters the scene tree for the first time.
func _ready():
	screensize = get_node("Camera/Camera2D").get_viewport_rect()
	get_node("spawn_enemy").start()
	pass # Replace with function body.

func spawn_enemy():
	var new_enemy = enemy.instantiate()
	new_enemy.global_position = Vector2(800, randi_range(screensize.position.y, screensize.end.y))
	new_enemy.velocity = Vector2(randi_range(-400, -800), 0)
	get_parent().add_child(new_enemy)
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_spawn_enemy_timeout():
	spawn_enemy()
	get_node("spawn_enemy").stop()
	get_node("spawn_enemy").start()
	pass # Replace with function body.
