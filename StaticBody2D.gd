extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var life = 20
var last_size_x = 400

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _process(delta):
	$ColorRect.rect_size.x = life * 20
	if $ColorRect.rect_size.x != last_size_x:
		$'../AudioStreamPlayer3'.play()
		last_size_x = $ColorRect.rect_size.x
	
	
