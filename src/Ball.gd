extends Area2D

signal hit_by_paddle(side)
signal hit_by_winning_wall(side)

const DEFAULT_SPEED = 100

export (int) var speed = DEFAULT_SPEED
export (int) var speed_inc = 25
export (int) var speed_max = 400
export (int) var speed_boost = 40

onready var _velocity : Vector2 = Vector2()

func _ready():
	randomize()
	var rng = randi() % 20
	if rng % 2 == 0:
		_velocity.x = -1
	else:
		_velocity.x = 1

func _process(delta):
	if _velocity.length() > 0:
		_velocity = _velocity.normalized()
	position += _velocity * speed * delta

func _on_Ball_body_entered(body : PhysicsBody2D):
	# Coliision masks are used to determine which object
	# has touched the ball.
	var collider_mask: int = body.get_collision_mask()
	match collider_mask:
		Global.COLISSION_MASKS.LEFT_WALL:
			emit_signal("hit_by_winning_wall", Global.SIDE.LEFT)
		Global.COLISSION_MASKS.RIGHT_WALL:
			emit_signal("hit_by_winning_wall", Global.SIDE.RIGHT)
		Global.COLISSION_MASKS.TOP_BOTTOM_WALL:
			_velocity.y *= -1
		Global.COLISSION_MASKS.LEFT_PADDLE:
			emit_signal("hit_by_paddle", Global.SIDE.LEFT)
			continue
		Global.COLISSION_MASKS.RIGHT_PADDLE:
			emit_signal("hit_by_paddle", Global.SIDE.RIGHT)
			continue
		_:
			_velocity.x *= -1
			speed += speed_inc
			if speed > speed_max:
				speed = speed_max

func move_up():
	_velocity.y += -1
	
func move_down():
	_velocity.y += 1
	
func get_position() -> Vector2:
	return position
	
func set_position(pos : Vector2):
	position = pos
	
func get_velocity() -> Vector2:
	return _velocity
	
func add_small_boost():
	speed += speed_boost
	
func reset():
	speed = DEFAULT_SPEED
	_ready()