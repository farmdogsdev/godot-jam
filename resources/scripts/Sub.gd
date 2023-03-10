extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const UP_DIRECTION := Vector2.UP

var speed := 400
var _velocity := Vector2.ZERO
var game_over = false
onready var game_over_screen = get_node("res://resources/GameOverScreen.tscn")

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


func _on_Collide_body_entered(body):
	if body.name == "WinZone":
		get_tree().change_scene("res://resources/WinScreen.tscn")
	elif body.name == "Lightbulb":
		$"../ParallaxBackground/HideScreen".visible = false
		$"../obstacles/HideScreen2".visible = false
	elif body.name == "Rock":
		game_over = true
	elif body.name == "Anchor":
		game_over = true
	elif body.name == "Leviathan":
		game_over = true
	elif body.name == "Shark":
		game_over = true
	elif body.name == "SchoolFish":
		game_over = true
	elif body.name == "SunkenShip":
		game_over = true
	
