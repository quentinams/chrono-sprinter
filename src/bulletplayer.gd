extends Area2D

var speed
var velocity = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not get_parent().get_node("Player").is_moving:
		position += (velocity * delta)/4
	else :
		position += velocity * delta
	if global_position.x > 800:
		queue_free()
	pass


func _on_area_entered(area):
	if area.is_in_group("enemy"):
		get_parent().score += 2
		queue_free()
		area.queue_free()
	if area.is_in_group("boss"):
		area.health -= 1
		get_parent().score += 1
		if area.health <= -1:
			get_parent().score += 50
			area.queue_free()
		queue_free()
	pass # Replace with function body.
