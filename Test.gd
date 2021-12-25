extends Node


func _input(event):
	if event.is_action_pressed("test"):
		$AudioStreamPlayer2D.play()
