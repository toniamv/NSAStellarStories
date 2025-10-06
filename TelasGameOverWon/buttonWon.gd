extends Button

func _pressed() -> void:
	# chama o gerenciador na CanvasLayer acima dele
	get_tree().quit()
