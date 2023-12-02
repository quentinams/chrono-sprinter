extends Node2D

var speed
var velocity = Vector2 (1000, 0)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += velocity * delta
	if global_position.x > 800:
		queue_free()
	pass
