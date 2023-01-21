extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const UP_DIRECTION := Vector2.UP

var speed := 600.0
var _velocity := Vector2.ZERO
onready var invulnerability_timer=$invulnerableTimer	
onready var effect_animation=$damageEffects
export(float)var max_health=100
onready var health=max_health
var rock_scene=preload("res://Rock.tscn")
var Rock=rock_scene.instance()
# Called when the node enters the scene tree for the first time.
func _ready():
	connect("collision", self, "_on_player_collision")

func _on_player_collision(collision):
	print("Collision detected!")
	damage(10)

# Connect the collision function to the "collision" signal


func damage(amt):
	print("damage")
	if invulnerability_timer.is_stopped():
		invulnerability_timer.start()
		_set_health(health-amt)
		effect_animation.play("damage")
		effect_animation.queue("flash")
		
func kill():
	pass

func _set_health(val):
	var prev_health=health
	health=clamp(val,0,max_health)
	if health!=prev_health:
		emit_signal("health_updated",health)
		if health==0:
			kill()
			emit_signal("killed")
					

func _on_invulnerableTimer_timeout():
	effect_animation.play("rest")



func _spawn_rock():

	_set_rock_position(Rock)
	add_child(Rock)

func _set_rock_position(Rock):
	var rect=get_viewport().size


	
	
func _physics_process(delta):
	var _horizontal_direction = (
		Input.get_action_strength("ui_right")
		- Input.get_action_strength("ui_left")
	)
	var _vertical_direction = (
		Input.get_action_strength("ui_down")
		- Input.get_action_strength("ui_up")
	)
	
	
	_velocity.x = _horizontal_direction * speed
	_velocity.y = _vertical_direction * speed
	
	_velocity.x+=200
	
	_velocity = move_and_slide(_velocity,UP_DIRECTION)
	$ProgressBar.value=health
	#_spawn_rock()
	#var offset=Rock.get_viewport().size*Vector2(0.5,0.5)
	#var posn=$Camera2D.get_viewport_rect().size*Vector2(0.5,0.5)
	#Rock.rect_position=posn-offset

