extends CharacterBody2D


@export var speed:float = 3.0;
@export var max_speed = 20;
@export var min_speed = 1;
var forward = Vector2(1,randf_range(-1,1)).normalized();
func _ready() -> void:
	velocity = Vector2(1,1).normalized();
	$respawn.play()

func _physics_process(delta: float) -> void:
	$Line2D.add_point(global_position)
	var collision: KinematicCollision2D = move_and_collide(forward * speed)
	if(position.y >92-32 and position.y < 92+32):
		if($hido.playing  ==false ):
			$hido.play()
	if(position.y >156 -32 and position.y <156 + 32):
		if($ti.playing  ==false ):
			$ti.play()
	if(position.y >220-32 and position.y < 220 + 32):
		if($la.playing  ==false ):
			$la.play()
	if(position.y >284 - 32 and position.y < 284 + 32):
		if($sol.playing  ==false ):
			$sol.play()
	if(position.y >348 - 32 and position.y < 348 + 32):
		if($fa.playing  ==false ):
			$fa.play()
	if(position.y >412 - 32 and position.y < 412 + 32):
		if($mi.playing  ==false ):
			$mi.play()
	if(position.y >476 - 32 and position.y < 476 + 32):
		if($re.playing  ==false ):
			$re.play()
	if(position.y >540 - 32 and position.y < 540 + 32):
		if($do.playing  ==false ):
			$do.play()
	
	if (collision):
		var collider = collision.get_collider()
		if collider.is_in_group("paddle"):
			if(collider.global_position.x < 200):
				$hit_2.play()
			else:
				$hit_3.play()
			var offset = (collider.global_position.y - global_position.y) / 80
			#print(offset)
			forward.y = -offset
			forward.x = forward.x * -1
			if (forward.x < .1 && forward.x > -.1):
				forward.x = .1
			forward = forward.normalized()
			
		else:
			forward = forward.bounce(collision.get_normal());
			speed = clamp (speed + 1, min_speed ,max_speed);
			$wallbounce.play()
		
		
	# Check if the position is greater than the screen height
	#if position.y > screen_height:
		#reset()
		
		
func reset(winner) -> void:
	## Reset the position of the ball
	speed = 3
	position = Vector2(566, 316)
	if(winner == 0):
		forward = Vector2(1,randf_range(-.5,.5)).normalized();
		$do.play()
		$mi.play()
		$sol.play()
	else:
		forward = Vector2(-1, randf_range(-.5,.5)).normalized();
		
		$re.play()
		$mi.play()
		$la.play()
		$do.play()
		$fa.play()
		$sol.play()
	$respawn.play()
		
	
	
