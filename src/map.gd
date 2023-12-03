extends Node2D
var scroll_x = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_parent().get_node("Player").is_moving:
		scroll_x -= 500 * delta
	else:
		scroll_x -= 200 * delta
	$ParallaxBackground.scroll_offset.x += scroll_x
	pass
