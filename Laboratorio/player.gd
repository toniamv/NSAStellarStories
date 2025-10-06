extends CharacterBody2D

signal player_entering_portal_signal
signal player_entered_portal_signal

@export var walk_speed = 4.0
const TILE_SIZE = 16

@onready var anim_tree = $AnimationTree
@onready var anim_state = anim_tree.get("parameters/playback")
@onready var ray = $RayCast2D
@onready var portal_ray = $PortalRayCast2D

var initial_position = Vector2(0, 0)
var input_direction = Vector2(0, 0)
var is_moving = false
var percent_moved_to_next_tile = 0.0

var stop_input: bool = false

func _ready():
	$Sprite2D.visible = true
	initial_position = position
	anim_tree.active = true
	anim_state.travel("Idle")

func entered_portal():
	emit_signal("player_entered_portal_signal")
	
func _physics_process(delta):
	if is_moving == false:
		process_player_movement_input()
	elif input_direction != Vector2.ZERO:
		anim_state.travel("Walk")
		move(delta)
	else:
		anim_state.travel("Idle")
		is_moving = false

func process_player_movement_input():
	if input_direction.y == 0:
		input_direction.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	if input_direction.x == 0:
		input_direction.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
		
	if input_direction != Vector2.ZERO:
		anim_tree.set("parameters/Idle/blend_position", input_direction)
		anim_tree.set("parameters/Walk/blend_position", input_direction)
		initial_position = position
		is_moving = true
	else:
		anim_state.travel("Idle")


func move(delta):
	var desired_step: Vector2 = input_direction * TILE_SIZE/2
	ray.target_position = desired_step
	ray.force_raycast_update()
	
	portal_ray.target_position = desired_step
	portal_ray.force_raycast_update()
	
	if portal_ray.is_colliding():
		var col = portal_ray.get_collider()
		if col.is_in_group("portal"):
			get_parent().troca_cena()
	if !ray.is_colliding():
		percent_moved_to_next_tile += walk_speed * delta
		if percent_moved_to_next_tile >= 1.0:
			position = initial_position + (TILE_SIZE * input_direction)
			percent_moved_to_next_tile = 0.0
			is_moving = false
			stop_input = true
		else:
			position = initial_position + (TILE_SIZE * input_direction * percent_moved_to_next_tile)
	else:
		is_moving = false
