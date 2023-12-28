extends Area2D
@onready var ball: Area2D = $"../Ball"

const MOVE_SPEED = 50

var _ball_dir

@onready var _screen_size_y = get_viewport_rect().size.y

func _ready():
	var n = String(name)
	if n == "Paddle2":
		_ball_dir = -1
	else:
		_ball_dir = 1


func _process(delta):
	#move paddle to track ball's y position.
	var target_y: float = ball.global_position.y
	var current_y: float = global_position.y
	var new_y: float = current_y
	
	if target_y < current_y:
		new_y -= MOVE_SPEED * delta
	else:
		new_y += MOVE_SPEED * delta
	
	new_y = clamp(new_y, 0, _screen_size_y)
	
	global_position.y = new_y
	print_debug("new_y = ", new_y,"-size y / 2 = ", -_screen_size_y / 2,"size y / 2 = ", _screen_size_y / 2)


func _on_area_entered(area):
	if area.name == "Ball":
		# Assign new direction.
		area.direction = Vector2(_ball_dir, randf() * 2 - 1).normalized()
