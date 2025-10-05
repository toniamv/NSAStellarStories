extends CharacterBody2D

@export var speed: float = 200.0

func _physics_process(delta: float) -> void:
	var dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var motion := dir * speed * delta

	# Move no eixo X
	var col := move_and_collide(Vector2(motion.x, 0.0))
	if col:
		motion.x = 0.0

	# Move no eixo Y (a partir da nova posição)
	col = move_and_collide(Vector2(0.0, motion.y))
	if col:
		motion.y = 0.0
