extends Node2D
var score:= [0,0];

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_score_l_body_entered(body: Node2D) -> void:

	score[0]+= 1
	$Score/Player2Score.text = (str(score[0]))
	$Ball.reset(1)
	pass # Replace with function body.



func _on_score_r_body_entered(body: Node2D) -> void:

	score[1]+=1
	$Score/PlayerScore.text = (str(score[1]))
	$Ball.reset(0)
	pass # Replace with function body.
