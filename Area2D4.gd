extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = 600
var laser = preload("res://shot.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process_input(true)

func _input(event):
	if Input.is_action_pressed("ui_accept"):
		disparar()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_up"):
		if position.y <= -114:
			position.y = -114
		else:
			position.y -= speed * delta
	if Input.is_action_pressed("ui_down"):
		if position.y >= 388:
			position.y = 388
		else:
			position.y += speed * delta
	if Input.is_action_pressed("ui_left"):
		if position.x <= -200:
			position.x = -200
		else:
			position.x -= speed * delta
	if Input.is_action_pressed("ui_right"):
		if position.x >= 714:
			position.x = 714
		else:
			position.x += speed * delta

func disparar():
	var l = laser.instance()
	l.position = $Position2D.global_position
	get_parent().add_child(l)
	$'../AudioStreamPlayer'.play()
	


func _on_Area2D3_area_entered(area):
	queue_free()
