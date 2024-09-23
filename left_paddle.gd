extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var mapped_value =0

func map_value(value: float, in_min: float, in_max: float, out_min: float, out_max: float) -> float:
	return (value - in_min) * (out_max - out_min) / (in_max - in_min) + out_min

# Example usage
"""
func _physics_process(delta: float) -> void:
	var bus_index = AudioServer.get_bus_index("Recorder")
	if bus_index != -1:
		var db_level = AudioServer.get_bus_peak_volume_left_db(bus_index, 0)
		if(db_level <= -80):
			mapped_value = 243
		elif(db_level > -3):
			mapped_value = -221;
		else:
			mapped_value = map_value(db_level, -50, -3, 243, -221)
			print(db_level)
		print(mapped_value)
		print("Decibel Level: ", db_level)
	else:
		var x = 1;
		#print("Audio bus 'Recorder' not found")
	position.y = mapped_value
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#var direction := Input.get_axis("ui_up", "ui_down")
	#print(position)
	#if direction:
	#	velocity.y = direction * SPEED
	#else:
	#	velocity.y = move_toward(velocity.x, 0, SPEED)
	
	move_and_slide()
"""
