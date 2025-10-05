extends CharacterBody2D

@export var speed = 150
@export var bullet_container: NodePath
const FlashScene := preload("res://AuroraScene/flash.tscn")

func _physics_process(delta):
	var dir = 0
	if Input.is_action_pressed("ui_left"):
		dir = -1
	elif Input.is_action_pressed("ui_right"):
		dir = 1

	velocity.x = dir * speed
	move_and_slide()

	if Input.is_action_just_pressed("ui_accept"):
		fire()

func fire():
	var b := FlashScene.instantiate()
	b.global_position = global_position + Vector2(0, -16)
	get_parent().get_parent().call_deferred("add_child", b)
