extends Control


onready var start_time = OS.get_ticks_msec()

var score = 0

func _ready():
	pass
	
func generate_score():
	var curr_time = OS.get_ticks_msec() - start_time
	score = curr_time / 64
	$"VBoxContainer/Score".text = "Score: " + str(score)
