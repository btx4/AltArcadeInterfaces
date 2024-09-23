extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var mapped_value
var magnitude_holder

var g3_buffer = []
var a4_buffer = []
var b4_buffer = []
var c4_buffer = []
var d4_buffer = []
var e4_buffer = []
var fSh4_buffer = []
var g5_buffer = []
var avg_g3 
var avg_a4
var avg_b4 
var avg_c4 
var avg_d4 
var avg_e4 
var avg_fSh4 
var avg_g5 

var decibel_buffer = []
var avgs = []

var BASE_VOLUME;

var maximum

var numSamples = 0;
var buffer_size = 15# Number of recent values to average


func _ready() -> void:
	var bus_index = AudioServer.get_bus_index("Recorder")
	magnitude_holder = AudioServer.get_bus_effect_instance(1, 0, 0)
	for i in range(30):
		var db_level = AudioServer.get_bus_peak_volume_left_db(bus_index, 0)
		decibel_buffer.append(db_level)
	BASE_VOLUME = decibel_buffer
	
func map_value(value: float, in_min: float, in_max: float, out_min: float, out_max: float) -> float:
	return (value - in_min) * (out_max - out_min) / (in_max - in_min) + out_min

func add_to_buffer(buffer: Array, value: float) -> void:
	buffer.append(value)
	if buffer.size() > buffer_size:
		buffer.pop_front()  # Keep the buffer size constant

func get_average(buffer: Array) -> float:
	var sum = 0.0
	for v in buffer:
		sum += v
	return sum / buffer.size()

func _physics_process(delta: float) -> void:
	# Add the gravity
	if not is_on_floor():
		velocity += get_gravity() * delta
		if velocity.y > 500:
			velocity.y = 500
		if position.y > 245:
			velocity.y = 0
	else:
		velocity.y = 0
	var bus_index = AudioServer.get_bus_index("Recorder")

	if bus_index != -1:
		var db_level = AudioServer.get_bus_peak_volume_left_db(bus_index, 0)
	#print("working")
		if db_level > -90:
			
			#print("Decibels", db_level)
			magnitude_holder = AudioServer.get_bus_effect_instance(1, 0, 0)
			
			var g3 = magnitude_holder.get_magnitude_for_frequency_range(0, 220)[1] 
			var a4 = magnitude_holder.get_magnitude_for_frequency_range(221, 250)[1] 
			var b4 = magnitude_holder.get_magnitude_for_frequency_range(251, 270)[1] 
			var c4 = magnitude_holder.get_magnitude_for_frequency_range(271, 300)[1] 
			var d4 = magnitude_holder.get_magnitude_for_frequency_range(301, 315)[1] 
			var e4 = magnitude_holder.get_magnitude_for_frequency_range(316, 340)[1] 
			var fSh4 = magnitude_holder.get_magnitude_for_frequency_range(341, 380)[1] 
			var g5 = magnitude_holder.get_magnitude_for_frequency_range(381, 410)[1] 

			# Add the current magnitude to buffers
			add_to_buffer(g3_buffer, g3)
			add_to_buffer(a4_buffer, a4)
			add_to_buffer(b4_buffer, b4)
			add_to_buffer(c4_buffer, c4)
			add_to_buffer(d4_buffer, d4)
			add_to_buffer(e4_buffer, e4)
			add_to_buffer(fSh4_buffer, fSh4)
			add_to_buffer(g5_buffer, g5)

			# Calculate the averages
			var avg_g3 = get_average(g3_buffer)
			var avg_a4 = get_average(a4_buffer)
			var avg_b4 = get_average(b4_buffer)
			var avg_c4 = get_average(c4_buffer)
			var avg_d4 = get_average(d4_buffer)
			var avg_e4 = get_average(e4_buffer)
			var avg_fSh4 = get_average(fSh4_buffer)
			var avg_g5 = get_average(g5_buffer)
			
			# Store averages in an array
			var avgs = [avg_g3, avg_a4, avg_b4, avg_c4, avg_d4, avg_e4, avg_fSh4, avg_g5]
			#print(avgs)

			# Find the index of the highest average
			maximum = find_max(avgs)
			#print(maximum)
			if avg_g3 > 0.001 and maximum == 0:
				#print(avg_g3)
				position.y = 540
				# clear_buffers()
			elif avg_a4 > 0.001 and maximum == 1:
				#print(avg_a4)
				position.y = 476
				# clear_buffers()
			elif avg_b4 > 0.001 and maximum == 2:
				print(avg_b4)
				position.y = 412
				# clear_buffers()
			elif avg_c4 > 0.001 and maximum == 3:
				print(avg_c4)
				position.y = 348  # 412 - 64
				# clear_buffers()
			elif avg_d4 > 0.001 and maximum == 4:
				print(avg_d4)
				position.y = 284  # 412 - 128
				# clear_buffers()
			elif avg_e4 > 0.001 and maximum == 5:
				print(avg_e4)
				position.y = 220  # 412 - 192 (or adjust as needed)
				# clear_buffers()
			elif avg_fSh4 > 0.001 and maximum == 6:
				print(avg_fSh4)
				position.y = 156  # 412 - 256 (or adjust as needed)
				# clear_buffers()
			elif avg_g5 > 0.001 and maximum == 7:
				#print(avg_g5)
				position.y = 92  # 412 - 320 (or adjust as needed)
				print("Paddle Position: ", global_position.y)
				# clear_buffers()
			
			
func find_max(avgs: Array) -> int:
	# Check if the array is empty to avoid errors
	if avgs.size() == 0:
		return -1  # Return -1 to indicate an invalid index

	var max_index = 0
	var max_value = avgs[0]

	# Iterate through the array to find the maximum value and its index
	for i in range(1, avgs.size()):
		if float(avgs[i]) > float(max_value):
			max_value = avgs[i]
			max_index = i

	return max_index
