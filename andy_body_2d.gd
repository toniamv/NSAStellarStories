extends CharacterBody2D

var speed = 150

func _physics_process(delta):
	if Input.is_action_just_pressed("ui_left"):
		velocity.x = -speed
	if Input.is_action_just_pressed("ui_right"):
		velocity.x = speed
	
	move_and_slide()
