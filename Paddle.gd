extends Area2D
@onready var ball: Area2D = $"../Ball"

const MOVE_SPEED = 200

var _ball_dir
var _up
var _down

@onready var _screen_size_y = get_viewport_rect().size.y

func _ready():
	var n = String(name)
	_up = n + "_move_up"
	_down = n + "_move_down"
	if n == "Paddle":
		_ball_dir = 1
	else:
		_ball_dir = -1


func _process(delta):
	# Move up and down based on input.
	var input = Input.get_action_strength(_down) - Input.get_action_strength(_up)
	position.y = clamp(position.y + input * MOVE_SPEED * delta, 16, _screen_size_y - 16)


func _on_area_entered(area):
	if area.name == "Ball":
		# Assign new direction.
		area.direction = Vector2(_ball_dir, randf() * 2 - 1).normalized()
		area.SPEED_MULTI += 0.1
