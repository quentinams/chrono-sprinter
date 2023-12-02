extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/ControleButton.grab_focus()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_controle_button_pressed():
	get_tree().change_scene_to_file("res://scene/menu/control_interface.tscn")
	
func _on_sound_button_pressed():
	print("sound button pressed")

func _on_exit_button_pressed():
	get_tree().change_scene_to_file("res://scene/menu/main_menu.tscn")
	print("Exit button pressed")
