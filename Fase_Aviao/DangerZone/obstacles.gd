extends Area2D

const IMAGES = ["res://DangerZone/DangerZone1.png", "res://DangerZone/DangerZone2.png", "res://DangerZone/DangerZone3.png"]
const COLLISION_SIZE = Vector2(120, 130)

func _ready():
	# Escolhe uma imagem aleatória
	var image_path = IMAGES[randi() % IMAGES.size()]
	$Sprite2D.texture = load(image_path)

	# Define o tamanho da colisão
	var shape = RectangleShape2D.new()
	shape.size = COLLISION_SIZE
	$CollisionShape2D.shape = shape
