extends CharacterBody2D

@export var move_speed: float = 200.0
@export var life_time: float = 5.0
var life_spawn := 0.0

func _physics_process(delta: float) -> void:
	# Sobe reto
	velocity = Vector2(0, -move_speed)
	var on_floor_before := is_on_floor() # opcional

	move_and_slide()

	# Se bater em algo, testa o(s) contato(s)
	for i in get_slide_collision_count():
		var col := get_slide_collision(i)
		var other := col.get_collider()
		if other and other.is_in_group("aurora"):
			get_tree().current_scene.register_hit()
			queue_free()
			return

	life_spawn += delta
	if life_spawn > life_time:
		queue_free()
