#extends CharacterBody2D
"""
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var mapped_value;
var magnitude_holder;
var low_pitch;
var medium_pitch;
var high_pitch;
var higher_pitch;
var highest;

func map_value(value: float, in_min: float, in_max: float, out_min: float, out_max: float) -> float:
	return (value - in_min) * (out_max - out_min) / (in_max - in_min) + out_min

func _physics_process(delta: float) -> void:
	# Add the gravity.
	#print(velocity.y)
	if not is_on_floor():
		velocity += get_gravity() * delta
		if(velocity.y>500):
			velocity.y = 500;
		if(position.y > 245):
			#print("ONFLOOR")
			velocity.y = 0
	else:
		velocity.y = 0;
	var bus_index = AudioServer.get_bus_index("Recorder")
	if bus_index != -1:
		var db_level = AudioServer.get_bus_peak_volume_left_db(bus_index, 0)
		magnitude_holder = AudioServer.get_bus_effect_instance(1,1,0);
		low_pitch = magnitude_holder.get_magnitude_for_frequency_range(20,140)[0];
		#medium_pitch = magnitude_holder.get_magnitude_for_frequency_range(100,120)[0];
		high_pitch = magnitude_holder.get_magnitude_for_frequency_range(140,200)[0];
		highest = magnitude_holder.get_magnitude_for_frequency_range(200,300)[0];
		#higher_pitch = magnitude_holder.get_magnitude_for_frequency_range(140,160)[0];
		if(db_level > -60):
			""""""
			if(low_pitch>medium_pitch && low_pitch > high_pitch && low_pitch>higher_pitch):
				print("LowPitch");
			elif(medium_pitch>low_pitch && medium_pitch > high_pitch && medium_pitch>higher_pitch):
				print("MediumPitch");
			elif(high_pitch>low_pitch && high_pitch > medium_pitch && high_pitch>higher_pitch):
				print("HighPitch");
			elif(higher_pitch>low_pitch && higher_pitch > medium_pitch && higher_pitch>high_pitch):
				print("HighestPitch");
			""""""
			if(low_pitch>high_pitch && low_pitch> highest):
				print("Low")
			elif(high_pitch>low_pitch && high_pitch> highest):
				print("high")
			else:
				print("Highest")
		else:
			print("tooQuiet")
			
		if(db_level >= -80):
			velocity.y -= 120  # Adjust the vertical velocity (assuming y is the vertical direction)
			#print(velocity.y)
			if(velocity.y < -500):
				velocity.y = -500;
	#print(position.y)
	move_and_slide()
	
	"""
