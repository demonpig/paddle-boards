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

extends KinematicBody2D

export (int) var speed = 10
export (String) var move_up_command = ""
export (String) var move_down_command = ""

onready var _velocity : Vector2 = Vector2()

func _process(delta):
	_velocity = Vector2()
	if Input.is_action_pressed(move_up_command):
		_velocity.y += -1
	if Input.is_action_pressed(move_down_command):
		_velocity.y += 1
	move_and_collide(_velocity * speed)

func get_position() -> Vector2:
	return position
	
func get_velocity() -> Vector2:
	return _velocity