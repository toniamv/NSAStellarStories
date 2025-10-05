extends CharacterBody2D

@export var move_speed := 100.0

func _physics_process(delta):
	var collision = move_and_collide(Vector2.DOWN * delta * move_speed)
	if collision:
		get_parent().get_parent().register_hit()
		return
	
	if $Sprite2D.global_position.y - ($CollisionShape2D.shape.radius)/2 > get_viewport_rect().size.y:
		queue_free()  # ou outro comportamento
