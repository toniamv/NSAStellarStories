extends Node2D

@export var max_hits: int = 5
@export var max_time: float = 30.0

var hits := 0
var time_left := 0.0
var _last_sec := -1

@onready var time_label: Label = $TimeLabel
@onready var hits_label: Label = $HitsLabel

func _ready() -> void:
	time_left = max_time
	hits = 0
	update_ui()

func _process(delta: float) -> void:
	if time_left <= 0.0:
		return
	time_left -= delta
	var sec := int(ceil(time_left))
	if sec != _last_sec:
		_last_sec = sec
		update_ui()
	if time_left <= 0.0:
		game_over()

func update_ui() -> void:
	time_label.text = "Tempo: %d" % int(max(time_left, 0.0))
	hits_label.text = "Acertos: %d/%d" % [hits, max_hits]

func register_hit() -> void:
	hits += 1
	update_ui()
	if hits >= max_hits:
		victory()

func victory() -> void:
	print("🎉 Vitória!")
	# trocar de cena / mostrar painel aqui

func game_over() -> void:
	print("⏰ Tempo esgotado!")
	# lógica de derrota aqui
