extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var vel = 1200

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += vel * delta
	if position.x > 1024:
		queue_free()


func _on_Area2D2_area_entered(area):
	if area.name != 'Area2D2':
		queue_free()

func _on_Area2D2_body_entered(body):
	if body.name != 'KinematicBody2D':
		body.life -= 1
		if body.life <= 0:
			get_tree().change_scene("res://Control3.tscn")
		queue_free()
