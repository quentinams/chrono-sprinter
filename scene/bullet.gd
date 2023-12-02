extends Node2D

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
