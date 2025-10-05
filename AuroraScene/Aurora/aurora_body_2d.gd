extends CharacterBody2D

class_name Aurora
var move_speed = 90
var start_direction = -1
var float_height = 12
var float_period = 1.6

@onready var sprite: AnimatedSprite2D = $AnimatedAurora2D

var _dir = 1
var _base_y = 0
var _t = 0

func _ready():
	_dir = sign(start_direction) if (start_direction != 0) else -1
	_base_y = global_position.y
	sprite.play("hair")

func _physics_process(delta):
	_t += delta
	var motion = Vector2(_dir * move_speed * delta, 0.0)
	var hit = move_and_collide(motion)
	if hit:
		_dir *= -1
		global_position.x += hit.get_normal().x * 0.5

	var omega = (PI * 2.0) / float_period
	var offset = abs(sin(_t * omega)) * float_height
	global_position.y = _base_y + offset
	
	
	return
