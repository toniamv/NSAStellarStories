extends Node2D

func troca_cena():
	var nova_cena = load("res://CenaIntermediaria/CenaLevaCutscene06.tscn")
	get_tree().change_scene_to_packed(nova_cena)
