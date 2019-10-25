# Paddle Boards
# Copyright (C) 2019 Max Mitschke
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

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