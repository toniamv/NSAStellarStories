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
		print("🎉 Vitória!")
		get_tree().change_scene_to_file("res://CenaIntermediaria/CenaLevaCutscene04.tscn")
	
	time_label.text = "Tempo: %d" % max(time - count, 0)
	if(count%2 == 0):
		var obs := Obstacle.instantiate()
		call_deferred("add_child", obs)

func register_hit():
	print("PERDEU")
	get_tree().change_scene_to_file("res://TelasGameOverWon/TelaGameOver.tscn")
