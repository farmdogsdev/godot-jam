extends ColorRect

onready var score_report = get_node("res://resources/GameUI.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	#$VBoxContainer2/RichTextLabel.text += str(score_report.get_score())

func _on_BackToTitle_pressed():
	get_tree().change_scene("res://resources/TitleScreen.tscn")


func _on_PlayAgain_pressed():
	get_tree().change_scene("res://resources/TestScene.tscn")
