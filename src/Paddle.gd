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