extends CharacterBody2D

func _physics_process(delta):
	var velocity = Vector2.ZERO
	# Exemplo de movimentação (substitua pela sua lógica)
	if Input.is_action_pressed("ui_right"):
		velocity.x = 200
	if Input.is_action_pressed("ui_left"):
		velocity.x = -200
	if Input.is_action_pressed("ui_down"):
		velocity.y = 200
	if Input.is_action_pressed("ui_up"):
		velocity.y = -200
	
	var socorro = move_and_collide(velocity*delta)
	if socorro:
		velocity = velocity.bounce(socorro.get_normal())
