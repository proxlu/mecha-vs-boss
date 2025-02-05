extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = 600
var laser = preload("res://shot.tscn")
var cooldown = 0.2  # Tempo de espera entre disparos (em segundos)
var tempo_ultimo_tiro = 0.0  # Armazena o tempo do último disparo

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process_input(true)


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
		if position.x >= 500:
			position.x = 500
		else:
			position.x += speed * delta
	if Input.is_action_pressed("ui_accept") and (tempo_ultimo_tiro + cooldown <= OS.get_ticks_msec() / 1000.0):
		disparar()
		tempo_ultimo_tiro = OS.get_ticks_msec() / 1000.0  # Atualiza o tempo do último disparo
		
func disparar():
	$'../AudioStreamPlayer'.play()
	var l = laser.instance()
	l.position = $Position2D.global_position
	get_parent().add_child(l)
