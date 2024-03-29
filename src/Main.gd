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

extends Node2D

var padding : int = 10

onready var BallInstance = $Ball.duplicate()

func _on_Ball_hit_by_paddle(side):
	var ball_position = $Ball.get_position()
	
	match side:
		# Ball hit the left paddle
		Global.SIDE.LEFT:
			move_ball($LeftPaddle)
		# Ball hit the right paddle
		Global.SIDE.RIGHT:
			move_ball($RightPaddle)

func _on_Ball_hit_by_winning_wall(side):
	match side:
		Global.SIDE.LEFT:
			$HUD.add_point_to_right_score()
		Global.SIDE.RIGHT:
			$HUD.add_point_to_left_score()
	reset_ball()

func move_ball(paddle):
	var ball_velocity = $Ball.get_velocity().y
	var paddle_velocity = paddle.get_velocity().y
	
	if paddle_velocity > 0:
		$Ball.move_down()
	elif paddle_velocity < 0:
		$Ball.move_up()

	if ball_velocity == paddle_velocity:
		$Ball.add_small_boost()

func reset_ball():
	$Ball.hide()
	$Ball.set_position(Vector2(512, 300))
	$Ball.reset()
	$Ball.show()

func _on_HUD_max_score_met(side):
	match side:
		Global.SIDE.LEFT:
			print("Left side won!")
		Global.SIDE.RIGHT:
			print("Right side won!")
	$HUD.reset()
