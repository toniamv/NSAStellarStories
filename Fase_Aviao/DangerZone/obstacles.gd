extends Node2D

const IMAGES = ["res://Fase_Aviao/DangerZone/DangerZone1.png", "res://Fase_Aviao/DangerZone/DangerZone2.png", "res://Fase_Aviao/DangerZone/DangerZone3.png"]
const COLLISION_SIZE = 45

func _ready():
	# Escolhe uma imagem aleatória
	var image_path = IMAGES[randi() % IMAGES.size()]
	$CharacterBody2D/Sprite2D.texture = load(image_path)
	$CharacterBody2D/Sprite2D.scale = Vector2(0.7, 0.7)

	# Define o tamanho da colisão
	var shape = CircleShape2D.new()
	shape.radius = COLLISION_SIZE
	$CharacterBody2D/CollisionShape2D.shape = shape
	$CharacterBody2D/CollisionShape2D.position = Vector2.ZERO
	
	$CharacterBody2D/Sprite2D.position = Vector2(randi_range(50, 300), -50)
	$CharacterBody2D/CollisionShape2D.position = $CharacterBody2D/Sprite2D.position
