extends Node2D

@onready var subvp: SubViewport = $CanvasLayer/SubViewportContainer/SubViewport

func _unhandled_input(event: InputEvent) -> void:
	subvp.push_input(event)
