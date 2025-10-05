extends Node2D

@export var speed = 150
const Obstacle := preload("res://Fase_Aviao/DangerZone/obstacles.tscn")

var time = 30
var count = 0

@onready var time_label: Label = $TimeLabel

func _ready():
	time_label.text = "Tempo: %d" % int(max(time, 0.0))

func _on_timer_timeout():
	count += 1
	
	if count >= 30:
		print("⏰ Tempo esgotado!")
		get_tree().quit()
	
	time_label.text = "Tempo: %d" % max(time - count, 0)
	if(count%2 == 0):
		var obs := Obstacle.instantiate()
		get_tree().current_scene.call_deferred("add_child", obs)

func register_hit():
	print("PERDEU")
	get_tree().quit()
