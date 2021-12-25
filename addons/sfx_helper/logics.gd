tool
extends Node


var base_volume = 0.0

export var min_volume = -3.0
export var max_volume = 3.0
export var min_pitch = 0.9
export var max_pitch = 1.1

var audio_player


# Set the audio volume and pitch to random in range
func _ready():
	randomize()
	
	audio_player = get_parent()
	base_volume = audio_player.get_volume_db()
	
	audio_player.connect("finished", self, "_on_finished")
	reset_parameter()


func _on_finished():
	#print("Finished")
	reset_parameter()


# Reset the parameter for new play
func reset_parameter():
	audio_player.set_volume_db(base_volume + rand_range(min_volume, max_volume))
	audio_player.set_pitch_scale(rand_range(min_pitch, max_pitch))


func _get_configuration_warning():
	var parent_class = get_parent().get_class()
	if not parent_class in ["AudioStreamPlayer", "AudioStreamPlayer2D", "AudioStreamPlayer3D"]:
		return "Please put this node under a Audio Player node!"
	
	return ""
