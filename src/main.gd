extends Node2D

var past = preload("res://scene/past/pastmain.tscn")
var score = 0
var enemy = preload("res://scene/enemy.tscn")
var bullet = preload("res://scene/bulletplayer.tscn")
@onready var screensize = get_node("Camera/Camera2D").get_viewport_rect()
@onready var red_part1 = $CanvasLayer/ControlHealth/RedPart1
@onready var red_part2 = $CanvasLayer/ControlHealth/RedPart2
@onready var red_part3 = $CanvasLayer/ControlHealth/RedPart3
@onready var score_label = $CanvasLayer/ControlScore/Label

func update_score():
	score_label.text = str(score)
	pass

func update_health_bar():
	if $Player.health == 3:
		red_part1.visible = false
		red_part2.visible = false
		red_part3.visible = true
	if $Player.health == 2:
		red_part1.visible = false
		red_part2.visible = true
		red_part3.visible = false
	if $Player.health == 1:
		red_part1.visible = true
		red_part2.visible = false
		red_part3.visible = false
	if $Player.health <= 0:
		red_part1.visible = false
		red_part2.visible = false
		red_part3.visible = false
	pass

func init_health_bar():
	red_part1.visible = false
	red_part2.visible = false
	red_part3.visible = true
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("spawn_enemy").start()
	$Player/gun_cooldown.start()
	init_health_bar()
	pass # Replace with function body.


func spawn_bullet():
	var new_bullet = bullet.instantiate()
	var new_bullet_pos = $Player.position + Vector2(20, 0)
	new_bullet.global_position = new_bullet_pos
	new_bullet.velocity = Vector2 (1000, 0)
	self.add_child(new_bullet)


func spawn_enemy():
	var new_enemy = enemy.instantiate()
	new_enemy.global_position = Vector2(1000, randi_range(screensize.position.y  + 25, screensize.end.y - 25))
	new_enemy.velocity = Vector2(randi_range(-200, -300), 0)
	self.add_child(new_enemy)
	pass

func gotopast():
	if score == 20:
		get_node("spawn_enemy").stop()
		hide()
		var past_ins = past.instantiate()
		score += 1;
		past_ins.score = score
		get_parent().add_child(past_ins)
		queue_free()


func _process(_delta):
	update_health_bar()
	update_score()
	if Input.is_action_just_pressed("player_shoot") and $Player/gun_cooldown.time_left <= 0:
		$Player.get_node("Pistol").visible = true
		spawn_bullet()
		$Player/pistolTimer.start()
		$Player.is_moving = true
		$Player/gun_cooldown.start()
	if !$Player.is_moving:
		get_node("spawn_enemy").wait_time = 2
	else :
		get_node("spawn_enemy").wait_time = 1
	gotopast()
	pass


func _on_spawn_enemy_timeout():
	spawn_enemy()
	pass # Replace with functi
	get_node("spawn_enemy").stop()
	get_node("spawn_enemy").start()
	pass

func _on_pistol_timer_timeout():
	$Player/pistolTimer.stop()
	$Player.get_node("Pistol").visible = false
	pass


func _on_gun_cooldown_timeout():
	$Player/gun_cooldown.stop()
	pass # Replace with function body.
