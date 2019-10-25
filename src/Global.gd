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

extends Node

enum COLISSION_MASKS { 
	LEFT_PADDLE = 1,
	RIGHT_PADDLE = 2,
	TOP_BOTTOM_WALL = 3,
	LEFT_WALL = 12,
	RIGHT_WALL = 20
}

enum SIDE {
	LEFT = -1,
	RIGHT = 1
}