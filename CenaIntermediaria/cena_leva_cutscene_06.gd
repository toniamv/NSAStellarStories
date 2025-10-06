extends Node2D

func _ready() -> void:
	# Conecta antes de iniciar
	if not Dialogic.timeline_ended.is_connected(_on_dialog_ended):
		Dialogic.timeline_ended.connect(_on_dialog_ended)

	# Inicia a timeline (NÃO chamar add_child aqui)
	Dialogic.start("res://Views/Cutscenes/cutscene06.dtl")

func _on_dialog_ended() -> void:
	print("Timeline terminou")
	# Troca de cena de forma segura durante o sinal
	get_tree().call_deferred("change_scene_to_file", "res://Views/aurora_cena_view.tscn")
