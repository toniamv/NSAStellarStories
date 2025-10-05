extends Node

func _ready():
	call_deferred("start_minigame")
	
func start_minigame():
	var Cutscene := preload("res://Cutscenes/cutscene.gd")
	var cut := Cutscene.instantiate()
	cut.dialogue = [
		{
			"speaker": "Rival",
			"text": "Ei! Preparado para o desafio de reflexo?",
			"portrait": preload("res://Cutscenes/Sprites/teste64.png"),
			"side": "right",
			"speed": 0.35
		},
		{
			"speaker": "Você",
			"text": "Bora lá!",
			"portrait": preload("res://Cutscenes/Sprites/teste64.png"),
			"side": "left"
		},
	]
	cut.next_scene = preload("res://AuroraScene/aurora_principal.tscn")  # troca ao final
	add_child(cut)  # sobrepõe como overlay; pausa o jogo por baixo
