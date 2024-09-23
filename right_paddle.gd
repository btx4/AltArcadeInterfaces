extends CharacterBody2D

const SPEED = 150.0

func _physics_process(delta: float) -> void:
	# Get the ball node from the parent
	var ball = get_parent().get_node("Ball")  # Adjust "Ball" to the name of your ball node

	if ball:
		# Access the ball's global position
		var ball_position = ball.global_position

		# Example check to move towards the ball's y position
		if global_position.y < ball_position.y - 50:
			velocity.y = SPEED
		elif global_position.y > ball_position.y + 50:
			velocity.y = -SPEED
		else:
			velocity.y = move_toward(velocity.y, 0, SPEED)

	# Move the character based on velocity
	move_and_slide()
