extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var inimigo = preload("res://ball.tscn")
var tempo_instanciar = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	tempo_instanciar += delta
	if tempo_instanciar > .5:
		spawn()
		tempo_instanciar = 0
		
func spawn():
	$'AudioStreamPlayer2'.play()
	var i = inimigo.instance()
	i.position = Vector2($Position2D.position.x,rand_range(50, 550))
	self.add_child(i)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
