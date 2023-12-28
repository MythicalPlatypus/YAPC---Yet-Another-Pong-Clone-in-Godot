extends Area2D

const DEFAULT_SPEED: int= 100
@export var SPEED_MULTI: int = 1

var _speed = DEFAULT_SPEED
var direction = Vector2.LEFT

@onready var _initial_pos = position

func _process(delta):
	_speed += delta * 2 * SPEED_MULTI
	position += _speed * delta * direction


func reset():
	direction = Vector2.LEFT
	position = _initial_pos
	_speed = DEFAULT_SPEED
