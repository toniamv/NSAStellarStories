extends CharacterBody2D

@export var move_speed := 200.0

func _physics_process(delta):
	var collision = move_and_collide(Vector2.UP * delta * move_speed)
	if collision:
		get_parent().get_parent().register_hit()
		queue_free()
		return
