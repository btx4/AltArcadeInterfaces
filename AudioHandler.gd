extends Node

func _process(delta):
	var bus_index = AudioServer.get_bus_index("Recorder")
	if bus_index != -1:
		var db_level = AudioServer.get_bus_peak_volume_left_db(bus_index, 0)
		
		#print("Decibel Level: ", db_level)
	else:
		var x = 1
		#print("Audio bus 'Recorder' not found")
