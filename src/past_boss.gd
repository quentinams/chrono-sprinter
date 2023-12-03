extends Area2D

var health = 100
var bullet = preload("res://scene/past/pastbullet.tscn")
var player

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("shoot_cooldown").start()
	player = get_parent().get_node("Player")
	pass # Replace with function body.

func shoot_player():
	var new_bullet = bullet.instantiate()
	new_bullet.global_position = Vector2(self.global_position.x, randi_range(600, 300))
	new_bullet.rotation = (player.global_position - new_bullet.position).angle()
	new_bullet.velocity = Vector2(700,0).rotated((player.global_position - new_bullet.position).angle())
	get_parent().add_child(new_bullet)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_parent().get_node("health").value = health
	if not player.is_moving:
		$shoot_cooldown.wait_time = 0.5
	else:
		$shoot_cooldown.wait_time = 0.1
	pass


func _on_shoot_cooldown_timeout():
	shoot_player()
	get_node("shoot_cooldown").stop()
	get_node("shoot_cooldown").start()
	pass # Replace with function body.
