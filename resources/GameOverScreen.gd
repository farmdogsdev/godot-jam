extends ColorRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_BackToTitle_pressed():
	get_tree().change_scene("res://resources/TitleScreen.tscn")


func _on_PlayAgain_pressed():
	get_tree().change_scene("res://resources/TestScene.tscn")
