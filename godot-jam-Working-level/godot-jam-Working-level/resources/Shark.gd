extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed=50
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position.x-=speed*delta
	


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	print("dead")
