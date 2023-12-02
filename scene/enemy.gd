extends Node2D

var bullet = preload("res://scene/bullet.tscn")
var speed
var velocity
# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("shoot_cooldown").start()
	pass # Replace with function body.

func shoot_player():
	var new_bullet = bullet.instantiate()
	var player = get_parent().get_node("Player")
	new_bullet.global_position = self.global_position
	new_bullet.velocity = Vector2(1000,0).rotated((player.global_position - new_bullet.position).angle())
	get_parent().add_child(new_bullet)
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += velocity * delta
	if global_position.x < -128:
		queue_free()
	pass
	


func _on_shoot_cooldown_timeout():
	shoot_player()
	get_node("shoot_cooldown").stop()
	get_node("shoot_cooldown").start()
	pass # Replace with function body.