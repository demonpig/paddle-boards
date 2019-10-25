extends Control

signal max_score_met(side)

export (int) var max_score = 11

var _left_score : int = 0
var _right_score : int = 0

func reset():
	_left_score = 0
	_right_score = 0
	update_scoreboard()

func update_scoreboard():
	$HBoxContainer/LeftScore.text = str(_left_score)
	$HBoxContainer/RightScore.text = str(_right_score)

func add_point_to_left_score():
	_left_score += 1
	update_scoreboard()
	if _left_score == max_score:
		emit_signal("max_score_met", Global.SIDE.LEFT)
	
func add_point_to_right_score():
	_right_score += 1
	update_scoreboard()
	if _right_score == max_score:
		emit_signal("max_score_met", Global.SIDE.RIGHT)