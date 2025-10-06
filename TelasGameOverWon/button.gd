extends Button

func _pressed() -> void:
	# chama o gerenciador na CanvasLayer acima dele
	get_tree().change_scene_to_file("res://CenaInicial/control.tscn")
