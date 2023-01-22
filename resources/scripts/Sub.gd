extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const UP_DIRECTION := Vector2.UP

var speed := 400
var _velocity := Vector2.ZERO
var game_over = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	if game_over:
		get_tree().change_scene("res://resources/GameOverScreen.tscn")
		
	$"../CanvasLayer/GameUI".generate_score()
		
	var _horizontal_direction = (
		Input.get_action_strength("ui_right")
		- Input.get_action_strength("ui_left")
	)
	var _vertical_direction = (
		Input.get_action_strength("ui_down")
		- Input.get_action_strength("ui_up")
	)
	
	if position.y >= 440:
		position.y = 440
	elif position.y <= 75:
		position.y = 75
	
	
	_velocity.x = _horizontal_direction * speed
	_velocity.y = _vertical_direction * speed
	
	_velocity.x+=200
	
	_velocity = move_and_slide(_velocity,UP_DIRECTION)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
