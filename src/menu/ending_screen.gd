extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/RestartButton.grab_focus()


var scroll_x = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	scroll_x -= 200 * delta
	$ParallaxBackground.scroll_offset.x = scroll_x


func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://scene/main.tscn")


func _on_exit_button_pressed():
	get_tree().quit()
