extends Area2D

var bullet = preload("res://scene/bullet.tscn")
var speed
var velocity = Vector2.ZERO
var player
# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("shoot_cooldown").start()
	player = get_parent().get_node("Player")
	$Sprite2D.play("default")
	pass # Replace with function body.


func shoot_player():
	var new_bullet = bullet.instantiate()
	new_bullet.global_position = self.global_position
	new_bullet.rotation = (player.global_position - new_bullet.position).angle()
	new_bullet.velocity = Vector2(700,0).rotated((player.global_position - new_bullet.position).angle())
	get_parent().add_child(new_bullet)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not player.is_moving:
		position += Vector2 (-75, 0) * delta
		$shoot_cooldown.wait_time = 3
	else:
		$shoot_cooldown.wait_time = 0.75
		position += velocity * delta
	if global_position.x < -128:
		queue_free()
	pass
	


func _on_shoot_cooldown_timeout():
	if player.global_position.x < self.global_position.x:
		shoot_player()
	get_node("shoot_cooldown").stop()
	get_node("shoot_cooldown").start()
	pass # Replace with function body.
