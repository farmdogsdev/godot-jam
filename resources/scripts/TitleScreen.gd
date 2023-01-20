extends ColorRect

func _on_Start_pressed():
	get_tree().change_scene("res://resources/TestScene.tscn")


func _on_Credits_pressed():
	get_tree().change_scene("res://resources/CreditsScreen.tscn")
