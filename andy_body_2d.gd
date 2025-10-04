extends CharacterBody2D

@export var speed := 150.0
const BulletScene := preload("res://flash.tscn")

func _physics_process(delta: float) -> void:
	var dir := 0.0
	if Input.is_action_pressed("ui_left"):
		dir = -1.0
	elif Input.is_action_pressed("ui_right"):
		dir = 1.0

	velocity.x = dir * speed
	move_and_slide()

	if Input.is_action_just_pressed("ui_accept"): # ou "fire"
		fire()

func fire() -> void:
	var b := BulletScene.instantiate()
	# posição global do player; ajusta o offset vertical conforme seu sprite
	b.position = b.position + Vector2(0, 1)
	# opcional: se o flash precisar saber a direção, passe aqui (ex.: b.direction = -Vector2.UP)
	get_tree().current_scene.call_deferred("add_child", b)
