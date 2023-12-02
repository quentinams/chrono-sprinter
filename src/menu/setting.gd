extends Control

@export
var bus_name: String

var bus_index: int

# Called when the node enters the scene tree for the first time.
func _ready():
	$AudioStreamPlayer.play()
	bus_index = AudioServer.get_bus_index("Master")
	$VBoxContainer/ControleButton.grab_focus()
	$VBoxContainer/volume_slider.value = 1
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


func _on_volume_slider_value_changed(value):
	print(value)
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(value))
