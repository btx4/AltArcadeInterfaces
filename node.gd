extends Node

var audio_player : AudioStreamPlayer
var fft_size : int = 2048
var samples : PoolRealArray = PoolRealArray()

func _ready():
	audio_player = $AudioStreamPlayer
	audio_player.play()
	# Set up a timer to periodically analyze the audio data
	var timer = Timer.new()
	timer.wait_time = 0.1
	timer.one_shot = false
	timer.connect("timeout", self, "_on_timeout")
	add_child(timer)
	timer.start()

func _on_timeout():
	var audio_data = audio_player.get_audio_stream().get_data()
	if audio_data.size() > fft_size:
		var fft = FFT.new()
		fft.size = fft_size
		fft.set_data(audio_data)
		fft.process()
		var frequencies = fft.get_frequencies()
		var pitch = frequencies.max_index()  # Simplistic pitch detection
		print("Detected pitch frequency: ", pitch)
