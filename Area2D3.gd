extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var inimigo = preload("res://ball.tscn")
var tempo_instanciar = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	tempo_instanciar += delta
	if tempo_instanciar > 3:
		spawn()
		tempo_instanciar = 0
		
func spawn():
	var i = inimigo.instance()
	self.add_child(i)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
